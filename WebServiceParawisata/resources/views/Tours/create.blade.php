<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Tour</title>
</head>

<body>
    <h1>Create a New Tour</h1>

    <form action="{{ route('tours.store') }}" method="post">
        @csrf

        <label for="name">Tour Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="area">Area:</label>
        <input type="text" id="area" name="area" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>

        <label for="lat">Latitude:</label>
        <input type="text" id="lat" name="lat" required>

        <label for="lang">Longitude:</label>
        <input type="text" id="lang" name="lang" required>

        <label>Categories:</label>
        @foreach ($categories as $category)
            <div>
                <input type="checkbox" id="category_{{ $category->id }}" name="categories[]" value="{{ $category->id }}">
                <label for="category_{{ $category->id }}">{{ $category->name }}</label>
            </div>
        @endforeach

        <label>Information:</label>
        @foreach ($informations as $info)
            <div>
                <input type="checkbox" id="information_{{ $info->id }}" name="information[]" value="{{ $info->id }}">
                <label for="information_{{ $info->id }}">{{ $info->name }}</label>
            </div>
        @endforeach

        <button type="submit">Create Tour</button>
    </form>
</body>

</html>
