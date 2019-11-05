<template>
    <q-list dark>
      <q-item>
<!--        <q-item-section avatar>-->
<!--          <q-icon name="stop" size="36px"/>-->
<!--        </q-item-section>-->

<!--        <q-item-section class="col-2 gt-sm">-->
<!--          <q-item-label class="q-mt-sm">GitHub</q-item-label>-->
<!--        </q-item-section>-->

        <q-item-section>
          <q-item-label lines="1">
            <span class="text-weight-medium">[quasarframework/quasar]</span>
            <span class="text-grey-8"> - GitHub repository</span>
          </q-item-label>
          <q-item-label caption lines="1">
            @rstoenescu in #3: > Generic type parameter for props
          </q-item-label>
          <q-item-label lines="1" class="q-mt-xs text-body2 text-weight-bold text-primary text-uppercase">
            <span class="cursor-pointer">Open in GitHub</span>
          </q-item-label>
        </q-item-section>

        <q-item-section side>
          <div class="q-gutter-xs">
            <q-btn class="gt-xs" size="12px" flat dense round icon="delete" />
            <q-btn class="gt-xs" size="12px" flat dense round icon="done" />
            <q-btn size="12px" flat dense round icon="more_vert" />
          </div>
        </q-item-section>
      </q-item>
      <div class="q-pl-md q-pr-md">
        <q-linear-progress dark stripe rounded style="height: 20px" :value="1"  />
      </div>
      <q-separator spaced />
    </q-list>

</template>
