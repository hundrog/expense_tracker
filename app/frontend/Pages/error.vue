<script setup>
import { computed } from "vue";
import Layout from "../Layouts/minimal.vue";

defineOptions({ layout: Layout });
const props = defineProps(["status"]);

const title = computed(() => {
  return {
    403: "403",
    404: "404",
    500: "500",
    503: "503",
  }[props.status];
});
const description = computed(() => {
  return {
    403: "Unauthorized",
    404: "Not found",
    500: "Serever Error",
    503: "Maintenance",
  }[props.status];
});
</script>

<template>
  <v-row align="center" justify="center" style="height: 100vh" class="linear-gradient">
    <v-col sm="12" md="4">
      <div class="text-h1 mx-auto text-center">{{ title }}</div>
      <div class="text-center py-8">{{ description }}</div>
      <div class="text-center">
        <iLink href="/expenses" class="inertia-link" as="v-btn"><v-btn variant="text" color="primary">
            Ir al inicio
          </v-btn></iLink>
      </div>
    </v-col>
  </v-row>
</template>

<style lang="scss" scoped>
.linear-gradient {
  background: linear-gradient(#78909C, #424242);
}
</style>
