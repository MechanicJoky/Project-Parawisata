<!-- resources/views/information.blade.php -->

<h1>Information</h1>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Image</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($information as $info)
            <tr>
                <td>{{ $info->id }}</td>
                <td>{{ $info->name }}</td>
                <td>
                    <img src="{{ asset('images/' . $info->image) }}" alt="">
                </td>
            </tr>
        @endforeach
    </tbody>
</table>
