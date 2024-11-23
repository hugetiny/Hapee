# Flutter Development Rules

## State Management with Hooks and Riverpod

### Hooks Best Practices

#### Object Creation and Persistence
1. Use `useMemoized` for objects that should persist across rebuilds
2. Always use empty const array for dependencies unless specific dependencies are needed
```dart
final persistentObject = useMemoized(
  () => ComplexObject(),
  const [], // Empty dependency array ensures single initialization
);
```

#### State Updates
1. Use `useEffect` for handling updates instead of recreating objects
2. Clearly specify effect dependencies
3. Return cleanup function when needed
```dart
useEffect(() {
  // Setup
  existingObject.update(newData);
  
  // Cleanup
  return () {
    existingObject.dispose();
  };
}, [newData]); // Only update when newData changes
```

#### Hook Selection Guidelines
1. `useState`: For simple local state
```dart
final counter = useState(0);
counter.value++; // Triggers rebuild
```

2. `useMemoized`: For expensive computations or object creation
```dart
final expensiveValue = useMemoized(() => compute(data), [data]);
```

3. `useCallback`: For function memoization
```dart
final handler = useCallback(() {
  // Handle event
}, [dependency]);
```

4. `useFuture`: For Future handling
```dart
final snapshot = useFuture(fetchData());
```

5. `useStream`: For Stream handling
```dart
final snapshot = useStream(dataStream);
```

### Riverpod Best Practices

#### Provider Types
1. `Provider`: For computed/cached values
```dart
final computedProvider = Provider((ref) => Complex.compute());
```

2. `StateProvider`: For simple state
```dart
final counterProvider = StateProvider((ref) => 0);
```

3. `StateNotifierProvider`: For complex state
```dart
final tasksProvider = StateNotifierProvider<TasksNotifier, List<Task>>((ref) => TasksNotifier());
```

4. `FutureProvider`: For async data
```dart
final userProvider = FutureProvider((ref) => fetchUser());
```

5. `StreamProvider`: For reactive data
```dart
final updatesProvider = StreamProvider((ref) => getUpdates());
```

#### Provider Organization
1. Group related providers in a single file
2. Use family modifier for parameterized providers
3. Use autoDispose when appropriate
```dart
final userProvider = FutureProvider.family.autoDispose((ref, String id) {
  return fetchUser(id);
});
```

#### Ref Usage
1. Use `watch` for reactive dependencies
2. Use `read` for one-time reads
3. Use `listen` for side effects
```dart
// In build method
final value = ref.watch(myProvider);

// In callbacks
ref.read(myProvider.notifier).update();

// For side effects
ref.listen(myProvider, (previous, next) {
  // Handle changes
});
```

### DataSource Management
1. Never recreate DataSource objects on data updates
2. Maintain sort and selection states within the DataSource
3. Use update methods instead of reconstruction
```dart
// Correct
final dataSource = useMemoized(() => MyDataSource(), const []);
useEffect(() { dataSource.updateData(newData); }, [newData]);

// Incorrect
final dataSource = MyDataSource(data); // Will recreate on every rebuild
```

### State Preservation
1. Maintain UI state during data updates:
   - Sort order
   - Selection state
   - Filter criteria
   - Scroll position
   - Form input values

2. Use appropriate storage methods:
   - `useMemoized` for complex objects
   - Provider state for shared state
   - Local state for UI-only state

### Error Handling
1. Use `AsyncValue` for error states
```dart
final provider = FutureProvider<Data>((ref) async {
  try {
    return await fetchData();
  } catch (e) {
    throw CustomError(e);
  }
});
```

2. Handle loading states appropriately
```dart
ref.watch(provider).when(
  data: (data) => DataWidget(data),
  loading: () => LoadingWidget(),
  error: (error, stack) => ErrorWidget(error),
);
```

## Common Pitfalls to Avoid
1. Recreating complex objects in build methods
2. Using useState for persistent objects
3. Missing effect dependencies
4. Mixing state management approaches
5. Forgetting to dispose resources
6. Watching providers in callbacks
7. Using BuildContext after dispose
