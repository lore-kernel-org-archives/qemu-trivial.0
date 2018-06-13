Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT5Fw-0008I4-Vm
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 08:52:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fT5Ft-0008Fh-MQ
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 08:52:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fT5Fs-0005vK-5n
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 08:52:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53716 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1fT5Fm-0005kN-7e; Wed, 13 Jun 2018 08:51:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B27A180125D6;
	Wed, 13 Jun 2018 12:51:57 +0000 (UTC)
Received: from [10.36.118.61] (unknown [10.36.118.61])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F09E71C5A5;
	Wed, 13 Jun 2018 12:51:39 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, 
	zhang.zhanghailiang@huawei.com, Markus Armbruster <armbru@redhat.com>, 
	qemu-trivial@nongnu.org
References: <1528866321-23886-1-git-send-email-thuth@redhat.com>
	<1528866321-23886-3-git-send-email-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <c6ba65c5-3a44-86ca-27fd-bb4ccadd4d5f@redhat.com>
Date: Wed, 13 Jun 2018 14:51:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1528866321-23886-3-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 12:51:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 13 Jun 2018 12:51:57 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 2/4] Replace '-enable-kvm' with '-accel
 kvm' in docs and help texts
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2018 12:52:07 -0000

On 13/06/2018 07:05, Thomas Huth wrote:
> The preferred way to select the KVM accelerator is to use "-accel kvm"
> these days, so let's be consistent in our documentation and help texts.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/COLO-FT.txt                  | 8 ++++----
>  docs/can.txt                      | 4 ++--
>  docs/multi-thread-compression.txt | 2 +-
>  docs/multiseat.txt                | 2 +-
>  docs/specs/tpm.txt                | 8 ++++----
>  hw/block/dataplane/virtio-blk.c   | 4 ++--
>  hw/scsi/virtio-scsi-dataplane.c   | 4 ++--
>  7 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
> index e289be2..d7c7dcd 100644
> --- a/docs/COLO-FT.txt
> +++ b/docs/COLO-FT.txt
> @@ -113,16 +113,16 @@ by using 'x-colo-lost-heartbeat' command.
>  == Test procedure ==
>  1. Startup qemu
>  Primary:
> -# qemu-kvm -enable-kvm -m 2048 -smp 2 -qmp stdio -vnc :7 -name primary \
> -  -device piix3-usb-uhci \
> +# qemu-system-x86_64 -accel kvm -m 2048 -smp 2 -qmp stdio -name primary \
> +  -device piix3-usb-uhci -vnc :7 \
>    -device usb-tablet -netdev tap,id=hn0,vhost=off \
>    -device virtio-net-pci,id=net-pci0,netdev=hn0 \
>    -drive if=virtio,id=primary-disk0,driver=quorum,read-pattern=fifo,vote-threshold=1,\
>           children.0.file.filename=1.raw,\
>           children.0.driver=raw -S
>  Secondary:
> -# qemu-kvm -enable-kvm -m 2048 -smp 2 -qmp stdio -vnc :7 -name secondary \
> -  -device piix3-usb-uhci \
> +# qemu-system-x86_64 -accel kvm -m 2048 -smp 2 -qmp stdio -name secondary \
> +  -device piix3-usb-uhci -vnc :7 \
>    -device usb-tablet -netdev tap,id=hn0,vhost=off \
>    -device virtio-net-pci,id=net-pci0,netdev=hn0 \
>    -drive if=none,id=secondary-disk0,file.filename=1.raw,driver=raw,node-name=node0 \
> diff --git a/docs/can.txt b/docs/can.txt
> index a357105..7ba23b2 100644
> --- a/docs/can.txt
> +++ b/docs/can.txt
> @@ -52,7 +52,7 @@ The ''kvaser_pci'' board/device model is compatible with and has been tested wit
>  The tested setup was Linux 4.9 kernel on the host and guest side.
>  Example for qemu-system-x86_64:
>  
> -    qemu-system-x86_64 -enable-kvm -kernel /boot/vmlinuz-4.9.0-4-amd64 \
> +    qemu-system-x86_64 -accel kvm -kernel /boot/vmlinuz-4.9.0-4-amd64 \
>        -initrd ramdisk.cpio \
>        -virtfs local,path=shareddir,security_model=none,mount_tag=shareddir \
>        -object can-bus,id=canbus0 \
> @@ -104,4 +104,4 @@ Links to other resources
>       Slides
>       http://rtime.felk.cvut.cz/publications/public/rtlws2015-qemu-can-slides.pdf
>   (5) Linux SocketCAN utilities
> -     https://github.com/linux-can/can-utils/
> \ No newline at end of file
> +     https://github.com/linux-can/can-utils/
> diff --git a/docs/multi-thread-compression.txt b/docs/multi-thread-compression.txt
> index d0caaf7..bb88c6b 100644
> --- a/docs/multi-thread-compression.txt
> +++ b/docs/multi-thread-compression.txt
> @@ -62,7 +62,7 @@ RAM: 128G
>  NIC: Intel I350 (10/100/1000Mbps)
>  Host OS: CentOS 7 64-bit
>  Guest OS: RHEL 6.5 64-bit
> -Parameter: qemu-system-x86_64 -enable-kvm -smp 4 -m 4096
> +Parameter: qemu-system-x86_64 -accel kvm -smp 4 -m 4096
>   /share/ia32e_rhel6u5.qcow -monitor stdio
>  
>  There is no additional application is running on the guest when doing
> diff --git a/docs/multiseat.txt b/docs/multiseat.txt
> index 807518c..dc28cdb 100644
> --- a/docs/multiseat.txt
> +++ b/docs/multiseat.txt
> @@ -18,7 +18,7 @@ or
>  
>  Next put together the qemu command line (sdk/gtk):
>  
> -qemu	-enable-kvm -usb $memory $disk $whatever \
> +qemu	-accel kvm -usb $memory $disk $whatever \
>  	-display [ sdl | gtk ] \
>  	-vga std \
>  	-device usb-tablet
> diff --git a/docs/specs/tpm.txt b/docs/specs/tpm.txt
> index c230c4c..70ad4a0 100644
> --- a/docs/specs/tpm.txt
> +++ b/docs/specs/tpm.txt
> @@ -98,7 +98,7 @@ QEMU files related to the TPM passthrough device:
>  Command line to start QEMU with the TPM passthrough device using the host's
>  hardware TPM /dev/tpm0:
>  
> -qemu-system-x86_64 -display sdl -enable-kvm \
> +qemu-system-x86_64 -display sdl -accel kvm \
>    -m 1024 -boot d -bios bios-256k.bin -boot menu=on \
>    -tpmdev passthrough,id=tpm0,path=/dev/tpm0 \
>    -device tpm-tis,tpmdev=tpm0 test.img
> @@ -164,7 +164,7 @@ swtpm socket --tpmstate dir=/tmp/mytpm1 \
>  Command line to start QEMU with the TPM emulator device communicating with
>  the swtpm:
>  
> -qemu-system-x86_64 -display sdl -enable-kvm \
> +qemu-system-x86_64 -display sdl -accel kvm \
>    -m 1024 -boot d -bios bios-256k.bin -boot menu=on \
>    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>    -tpmdev emulator,id=tpm0,chardev=chrtpm \
> @@ -222,7 +222,7 @@ swtpm socket --tpmstate dir=/tmp/mytpm1 \
>  
>  In a 2nd terminal start the VM:
>  
> -qemu-system-x86_64 -display sdl -enable-kvm \
> +qemu-system-x86_64 -display sdl -accel kvm \
>    -m 1024 -boot d -bios bios-256k.bin -boot menu=on \
>    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>    -tpmdev emulator,id=tpm0,chardev=chrtpm \
> @@ -255,7 +255,7 @@ swtpm socket --tpmstate dir=/tmp/mytpm1 \
>  In the 2nd terminal restore the state of the VM using the additonal
>  '-incoming' option.
>  
> -qemu-system-x86_64 -display sdl -enable-kvm \
> +qemu-system-x86_64 -display sdl -accel kvm \
>    -m 1024 -boot d -bios bios-256k.bin -boot menu=on \
>    -chardev socket,id=chrtpm,path=/tmp/mytpm1/swtpm-sock \
>    -tpmdev emulator,id=tpm0,chardev=chrtpm \
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-blk.c
> index d648aeb..8c37bd3 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -190,8 +190,8 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>      /* Set up guest notifier (irq) */
>      r = k->set_guest_notifiers(qbus->parent, nvqs, true);
>      if (r != 0) {
> -        fprintf(stderr, "virtio-blk failed to set guest notifier (%d), "
> -                "ensure -enable-kvm is set\n", r);
> +        error_report("virtio-blk failed to set guest notifier (%d), "
> +                     "ensure -accel kvm is set.", r);
>          goto fail_guest_notifiers;
>      }
>  
> diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
> index 912e500..b995bab 100644
> --- a/hw/scsi/virtio-scsi-dataplane.c
> +++ b/hw/scsi/virtio-scsi-dataplane.c
> @@ -142,8 +142,8 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
>      /* Set up guest notifier (irq) */
>      rc = k->set_guest_notifiers(qbus->parent, vs->conf.num_queues + 2, true);
>      if (rc != 0) {
> -        fprintf(stderr, "virtio-scsi: Failed to set guest notifiers (%d), "
> -                "ensure -enable-kvm is set\n", rc);
> +        error_report("virtio-scsi: Failed to set guest notifiers (%d), "
> +                     "ensure -accel kvm is set.", rc);
>          goto fail_guest_notifiers;
>      }
>  
> 

Queued this one.  Thanks,

Paolo

