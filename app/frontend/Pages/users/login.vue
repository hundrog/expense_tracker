<template>
  <v-row align="center" justify="center" style="height: 100vh" >
    <v-col sm="12" md="4">
      <div class="text-h2 text-center pb-8">Expenses Tracker</div>
      <form @submit.prevent="submit">
        <v-text-field name="email" label="email" v-model="values.email" autocomplete="email"></v-text-field>

        <v-text-field name="password" label="password" v-model="values.password" autocomplete="current-password"
          :type="show ? 'text' : 'password'" :append-inner-icon="show ? 'mdi-eye-off' : 'mdi-eye'"
          @click:append-inner="show = !show"></v-text-field>

        <div class="text-center py-4">
          <v-btn block size="large" class="me-4" type="submit" color="primary">
            Conectar
          </v-btn>
        </div>
      </form>
      <v-row justify="space-between" class="pb-6 pt-2">
        <iLink href="#" class="inertia-link text-body-2" as="a">
          Crear cuenta
        </iLink>
        <iLink href="#" class="inertia-link text-body-2" as="a">
          Olvide mi contraseña
        </iLink>
      </v-row>
    </v-col>
  </v-row>
</template>

<script setup>
import { ref } from "vue"
import Layout from "../../Layouts/minimal.vue";
import { useForm } from "@inertiajs/vue3";
import { usersSessions as sessionsApi } from "../../api";

defineOptions({ layout: Layout });

const show = ref(false);
const values = ref(
  {
    email: "",
    password: ""
  }
);

const submit = async () => {
  const form = useForm({
    user: { ...values.value },
  });

  form.post(sessionsApi.create.path())
};
</script>

<style lang="scss" scoped>
.inertia-link {
  color: #F5F5F5;
  text-decoration-line: none;
}
</style>
