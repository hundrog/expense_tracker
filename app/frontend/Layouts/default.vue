<template>
  <v-app id="inspire">
    <v-navigation-drawer v-model="drawer">
      <v-list>
        <iLink v-for="resource in resources" :key="resource.name" :href="resource.uri" role="navigation"
          class="inertia-link">
          <v-list-item :value="resource.name" color="primary" link>
            <template v-slot:prepend>
              <v-icon :icon="resource.icon" />
            </template>
            <v-list-item-title>{{ resource.name }}</v-list-item-title>
          </v-list-item>
        </iLink>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar color="primary-darken-1">
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

      <v-app-bar-title>Application</v-app-bar-title>
      <iLink :href="sessionsApi.destroy.path()" method="delete" class="inertia-link" as="v-btn">
        <v-btn v-if="$page.props.auth?.user">logout</v-btn>
      </iLink>
    </v-app-bar>

    <v-main>
      <v-container>
        <slot />
      </v-container>
    </v-main>
  </v-app>
</template>

<script setup>
import { ref } from 'vue'
import { usersSessions as sessionsApi } from "../api";

const drawer = ref(null)
const resources = [
  { name: "Expenses", uri: "/expenses", icon: "mdi-finance" },
  { name: "Categories", uri: "/categories", icon: "mdi-rhombus-split" },
]
</script>

<style lang="scss" scoped>
.inertia-link {
  color: #F5F5F5;
  text-decoration-line: none;
}
</style>
