<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tours Index</title>
    <!-- Tambahkan link ke Bootstrap CSS untuk modal -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
    </script>
</head>

<body>
    <h1 class="mb-4">List of Tours</h1>

    <div class="row">
        @forelse($tours as $tour)
            <div class="col-md-6 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">{{ $tour->name }}</h2>
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td>Area</td>
                                    <td>{{ $tour->area }}</td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td>{{ $tour->address }}</td>
                                </tr>
                                <tr>
                                    <td>Latitude</td>
                                    <td>{{ $tour->lat }}</td>
                                </tr>
                                <tr>
                                    <td>Longitude</td>
                                    <td>{{ $tour->lang }}</td>
                                </tr>
                            </tbody>
                        </table>

                        @if (!$tour->imageTour->isEmpty())
                            <!-- Perbaikan: Ganti data-toggle dan data-target dengan data-bs-toggle dan data-bs-target -->
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#imageModal{{ $tour->id }}">
                                View Image
                            </button>
                        @else
                            <!-- Perbaikan: Tambahkan type="submit" pada tombol "Add Image" -->
                            <button type="submit" class="btn btn-success" data-bs-toggle="modal"
                                data-bs-target="#imageModal{{ $tour->id }}">
                                Add Image
                            </button>
                        @endif

                        <h3 class="mt-3">Categories:</h3>
                        <ul>
                            @forelse($tour->categories as $category)
                                <li>
                                    <strong>{{ $category->name }}</strong>
                                    @if ($category->image)
                                        <img src="{{ asset("images/{$category->image}") }}" alt="Category Image"
                                            width="100">
                                    @endif
                                </li>
                            @empty
                                <li>No categories found</li>
                            @endforelse
                        </ul>

                        <h3>Information:</h3>
                        <ul>
                            @forelse($tour->information as $information)
                                <li>
                                    <strong>{{ $information->name }}</strong>
                                    @if ($information->image)
                                        <img src="{{ asset("images/{$information->image}") }}" alt="Information Image"
                                            width="100">
                                    @endif
                                </li>
                            @empty
                                <li>No information found</li>
                            @endforelse
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Modal untuk gambar -->
<div class="modal fade" id="imageModal{{ $tour->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Gambar untuk {{ $tour->name }}</h5>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                @if(!$tour->imageTour->isEmpty())
                    <h6>Gambar yang Ada:</h6>
                    <ul>
                        @foreach($tour->imageTour as $index => $image)
                            <li>
                                <img src="{{ asset("images/{$image->image}") }}" alt="Gambar Wisata" width="100">
                                <!-- Tambahkan tombol untuk melihat setiap gambar secara individual -->
                            </li>

                            <!-- Modal untuk melihat setiap gambar secara individual -->
                            <div class="modal fade" id="singleImageModal{{ $tour->id }}_{{ $index }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Lihat Gambar</h5>
                                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <img src="{{ asset("images/{$image->image}") }}" alt="Gambar Wisata" width="100%">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </ul>
                @else
                    <p>Tidak ada gambar ditemukan</p>
                @endif

                <!-- Form untuk menambahkan gambar baru -->
                <form action="{{ route('tours.addImage', ['tour' => $tour->id]) }}" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="mb-3">
                        <label for="image" class="form-label">Tambahkan Gambar</label>
                        <input type="hidden" name="tours_id" value="{{ $tour->id }}">
                        <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Unggah</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
            </div>
        </div>
    </div>
</div>

        @empty
            <p>No tours found</p>
        @endforelse
        <div class="text-center">
            <a href="{{ route('tours.create') }}" class="btn btn-primary">Tambah Data Tur Baru</a>
        </div>
    </div>
</body>
</html>
