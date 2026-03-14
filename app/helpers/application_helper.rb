# app/helpers/application_helper.rb

module ApplicationHelper

  def category_icon(category)
    icons = {
      "furniture"   => "fa-solid fa-couch",
      "clothes"     => "fa-solid fa-shirt",
      "toys"        => "fa-solid fa-gamepad",
      "books"       => "fa-solid fa-book-open",
      "electronics" => "fa-solid fa-laptop",
      "sports"      => "fa-solid fa-futbol",
      "garden"      => "fa-solid fa-seedling",
      "kitchen"     => "fa-solid fa-utensils",
      "tools"       => "fa-solid fa-screwdriver-wrench",
      "art"         => "fa-solid fa-palette",
      "other"       => "fa-solid fa-box-open"
    }
    icons[category.to_s] || "fa-solid fa-box-open"
  end

  def condition_class(condition)
    classes = {
      "new"       => "cn",
      "very_good" => "cvg",
      "good"      => "cb",
      "fair"      => "cf"
    }
    classes[condition.to_s] || "cb"
  end

  def hunter_level_class(level)
    classes = {
      "bronze"   => "lv-b",
      "silver"   => "lv-s",
      "gold"     => "lv-g",
      "platinum" => "lv-p"
    }
    classes[level.to_s] || "lv-b"
  end

  def distance_in_km(donation)
    return "?" unless donation.latitude && donation.longitude

    "< 5 km" # simplifié pour l'instant
  end
end
