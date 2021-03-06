# The Patient class needs a class variable @@all that begins as an empty array.
# The Patient class needs a class method .all that lists each patient in the class variable.
# A patient is instantiated with a name and be saved in the @@all array.
# The Patient class needs an instance method, #new_appointment, that takes in an argument of a doctor and a date and creates a new appointment. The appointment should know that it belongs to the patient.
# The Patient class needs an instance method, #appointments, that iterates through the appointments array and returns appointments that belong to the patient.
# The Patient class needs an instance method, #doctors, that iterates over that patient's appointments and collects the doctor that belongs to each appointment.

class Patient
  @@all = []

  attr_accessor :name

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(doctor, date)
    Appointment.new(self, date, doctor)
  end

  def appointments
    Appointment.all.select {|appointment| appointment.patient }
  end

  def doctors
    self.appointments.map do |appointment|
      appointment.doctor
    end
  end
end