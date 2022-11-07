import express from 'express';
import { PrismaClient } from '@prisma/client';

const app = express();

app.use(express.json());

const prisma = new PrismaClient();

app.post('/tutors', async (request, response) => {
  const {
    nameTutor,
    rgId,
    cpfId,
    ocupation,
    phone,
    email,
    address,
    pets,
    observations,
    fileRg,
    fileResidence,
  } = request.body;

  const tutor = await prisma.tutor.create({
    data: {
      nameTutor,
      rgId,
      cpfId,
      ocupation,
      phone,
      email,
      address: {
        create: {
          street: address.street,
          number: address.number,
          complement: address.complement,
          district: address.district,
          city: address.city,
        },
      },
      pets: {
        create: pets.map((pet) => ({
          id: pet.id,
          petType: pet.petType,
          age: pet.age,
          castrated: pet.castrated,
          wormed: pet.wormed,
          vac: pet.vac,
          vacsName: {
            create: {
              rabica: pet.vacsName.rabica,
              raiva: pet.vacsName.raiva,
            },
          },
          latestVacDate: pet.latestVacDate,
        })),
      },
      observations,
      fileRg,
      fileResidence,
    },
  });

  return response.json(tutor);
});

app.get('/tutors', async (request, response) => {
  const tutors = await prisma.tutor.findMany({
    include: {
      address: true,
      pets: true,
    },
  });

  return response.json(tutors);
});

// const tutorExample = {
//   nameTutor: 'João',
//   rgId: '123456789',
//   cpfId: '123456789',
//   ocupation: 'Estudante',
//   phone: '123456789',
//   email: 'joao@email.com',
//   address: {
//     street: 'RuadasFlores',
//     number: '123',
//     complement: 'Casa',
//     district: 'Centro',
//     city: 'SãoPaulo',
//   },
//   pets: [
//     {
//       id: '123456789',
//       petType: 'Cachorro',
//       age: '1',
//       castrated: true,
//       wormed: true,
//       vac: true,
//       vacsName: {
//         rabica: true,
//         raiva: true,
//       },
//       latestVacDate: '2021-01-01',
//     },
//   ],
//   observations: 'Observações',
//   fileRg: 'fileRg',
//   fileResidence: 'fileResidence',
// };

app.listen(3333, () => console.log('Server is running!'));
