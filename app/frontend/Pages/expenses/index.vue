<template>
  <div v-for="expense in expenses" :key="expense.id" class="pa-4">
    <v-card :color="expense.category_color">
      <template v-slot:title>
        {{ expense.name }}
      </template>

      <template v-slot:subtitle>
       {{ expense.amount }}
      </template>
    </v-card>
  </div>
</template>

<script setup>
defineProps(["expenses"]);
</script>
