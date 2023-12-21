<?php include 'partials/header.php'; ?>
<div class="col">
        <div class="card">
            <div class="card-body">
                <h4>Data Diri</h4>
                <span>Nama : <b><?= $_SESSION['nama_pelanggan'] ?></b></span><br>
                <span>Alamat : <b><?= $_SESSION['alamat_pelanggan'] ?></b></span><br>
                <span>Email : <b><?= $_SESSION['email_pelanggan'] ?></b></span><br>
                <hr>
                <span>Terima Kasih Telah Registrasi</span>
            </div>
        </div>
    </div>
    <div class="col mt-3">
        <div>
            <h4 class="mb-3">Pembayaranku</h4>
            <?php

                $pelanggan = $_SESSION['id_pelanggan'];

                $no = 1;
                $tampil = mysqli_query($koneksi, "SELECT p.*, o.nama_obat, pel.nama_pelanggan
                FROM data_penjualan p
                JOIN data_pelanggan pel ON p.id_pelanggan = pel.id_pelanggan
                JOIN data_obat o ON p.id_obat = o.id_obat
                WHERE p.id_pelanggan = $pelanggan");
                while($data = mysqli_fetch_array($tampil)):
                ?>
			      		<div id="container-booking-list">
                            <div id="no-data-row" class="card mb-3 nodata">						 
                                <div class="no-gutters">						    					    
                                        <div class="">						      
                                        <div class="card-header ">							  	
                                            <div class="row">								    
                                                <div class="col text-left text-muted">ID Penjualan : <strong>
                                                    <?= $data['id_penjualan'] ?>
                                                </strong>
                                            </div>								    
                                            <div style="text-align:right;" class="col text">
                                                <strong class="bayar"  ><?= "Rp " . number_format($data['harga_penjualan'], 0, ',', '.') ?>
                                            </strong>
                                            </div>							    
                                        </div>
                                        							  
                                        </div>
                                        <div class="card-body"><p class="card-text"><?= $data['nama_obat'] ?></p></div>
                                        </div>
                                        <div class="card-footer">
                                            <div class="row">

                                            <div class="col text-end action-right">
                                                <?php if($data['status_penjualan'] =='Proses') { ?>
                                                <span class="badge bg-info"><?= $data['status_penjualan'] ?> <i class="fas fa-ban"></i></span>
                                                <?php } elseif($data['status_penjualan'] =='Sudah Bayar') { ?>
                                                <span class="badge bg-success"><?= $data['status_penjualan'] ?> <i class="fas fa-ban"></i></span>
                                                <?php } else { ?>
                                                    <a href="konfirmasi_pembayaran.php?hal=konfirmasi&id=<?= $data['id_penjualan'] ?>" class="btn-link disabled">Konfirmasi Pembayaran</a>
                                                <?php } ?>
                                            </div>
                                            </div>
                                            </div>				  
                                        </div>						
                                    </div>
                                </div>
			            </div>
        <?php
                 endwhile; 
                ?>
    </div>
        </div>
 
<?php include 'partials/footer.php'; ?>

