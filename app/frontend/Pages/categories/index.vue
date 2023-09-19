<template>
  <v-container>
    <div v-for="category in categories" :key="category.id" class="pa-4">
      <v-card :text="category.name" :color="category.color"/>
    </div>
  </v-container>
</template>

<script setup>
defineProps(["categories"]);
</script>
