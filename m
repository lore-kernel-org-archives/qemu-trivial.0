Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j2ZTG-0003vj-EO
	for mharc-qemu-trivial@gnu.org; Fri, 14 Feb 2020 06:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pmathieu@redhat.com>) id 1j2ZT7-0003lg-9e
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 06:49:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1j2ZT5-0003yZ-Tn
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 06:49:13 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20372
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1j2ZT5-0003xm-QS
 for qemu-trivial@nongnu.org; Fri, 14 Feb 2020 06:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581680951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFvaTCTEaTis1kHxf/zXWMl8zUogwJE6vzDoyS7CHdU=;
 b=KlKuS+pzu23l73cFCIxd8B22tcR+ftRkokH5iO5f/lUk7iWqupK60oxTBJlcfjK1RQUYMV
 ZpP2XNgZ3obSzxA5TfXwXLwb4cOSmSFJYdoXHNjIbc+0DTCI9DsBbdWu0H19CrZrAxuxBY
 mVeDiG0bUvo8SlRHwtCyBqNzTDN+++k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-hc9NIskOOb6AHBTTG1IeCg-1; Fri, 14 Feb 2020 06:49:08 -0500
Received: by mail-wm1-f69.google.com with SMTP id f207so3729963wme.6
 for <qemu-trivial@nongnu.org>; Fri, 14 Feb 2020 03:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xN3VCnO3L7pjsWeJ3JWTUgIjKKiRtnohYldnGla6cFI=;
 b=rXI8CVFe7Bc6v8VXS0kXptof8ohrMnhxrgnjEOpPVO5/d7KmGhGDU82nzcfGLWLf2H
 ogbXiWOq4Nl22ZnrsjD6Jk2A+eIDXRj/KANcCixttO4w1+AOQ+z80shzUw+6ofMdUFHC
 NeDtf7pF9AKet7wu3EIxuM0otweFLz+ZHMXpEzJ71wl9OUrVdNE3HPckvRi27fLO6lq5
 PplrwJt+VQn0yIbLhiKVhH7WxdVbabq/N53/PTbaHyPMq6j5MlGHdXRFik/ZELBLlZ33
 S2lYTZXxmVAOOcMtzKN33DHLSgHmdkM44qFVq+QjzkFRnJDVeH6VibruwLob0UJPFcxq
 Rgjw==
X-Gm-Message-State: APjAAAUTLCzCmAWTPJjJt3UJu3WSPs9rgyOLmkE4Q6cam4s+pJQCRLzZ
 aCJ6UuJ33XfxMG86neapRht7ne2Y/vZQAzYomPNe1LjuT1QngZMh5qdw8YUGLOj8t68jkFxMNnx
 i7nXNZiK0JvRlEDfbcjFb3NJhqjh7MjR4qQ==
X-Received: by 2002:a05:600c:291d:: with SMTP id
 i29mr4453163wmd.39.1581680946591; 
 Fri, 14 Feb 2020 03:49:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxU/nAv/213va+gH14Su/o/3Q/V8aZOKJtmzscZoPiPvhzHlSesFNEbCTFqPY9xXFQCgJzlB0VyL67Ax1BhACk=
X-Received: by 2002:a05:600c:291d:: with SMTP id
 i29mr4453140wmd.39.1581680946276; 
 Fri, 14 Feb 2020 03:49:06 -0800 (PST)
MIME-Version: 1.0
References: <2dc5a0962a38b912e4fa4900f9813b7ea1a9273c.1581670009.git.mprivozn@redhat.com>
 <ef161708-2ecc-8d51-7dae-6a860659a8a9@redhat.com>
In-Reply-To: <ef161708-2ecc-8d51-7dae-6a860659a8a9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Fri, 14 Feb 2020 12:48:55 +0100
Message-ID: <CAP+75-WjUiPgB-KuzYSDf=8Duyadm-qo3E+VuuPTkxVPOA2yVg@mail.gmail.com>
Subject: Re: [PATCH] Report stringified errno in VFIO related errors
To: Michal Privoznik <mprivozn@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, 
 Alex Williamson <alex.williamson@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
X-MC-Unique: hc9NIskOOb6AHBTTG1IeCg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Feb 2020 11:49:17 -0000

On Fri, Feb 14, 2020 at 10:20 AM Michal Privoznik <mprivozn@redhat.com> wro=
te:
> On 2/14/20 9:47 AM, Michal Privoznik wrote:
> > In a few places we report errno formatted as a negative integer.
> > This is not as user friendly as it can be. Use strerror() and/or
> > error_setg_errno() instead.
> >
> > Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> > ---
> >   hw/vfio/common.c    | 2 +-
> >   util/vfio-helpers.c | 6 +++---
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> >
>
> BTW the reason I've noticed these is because I'm seeing some errors when
> assigning my NVMe disk to qemu. This is the full command line:
>
>
> /home/zippy/work/qemu/qemu.git/x86_64-softmmu/qemu-system-x86_64 \
> -name guest=3Dfedora,debug-threads=3Don \
> -S \
> -object
> secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-2=
-fedora/master-key.aes
> \
> -machine pc-i440fx-4.1,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff \
> -cpu host \
> -m size=3D4194304k,slots=3D16,maxmem=3D1099511627776k \
> -overcommit mem-lock=3Doff \
> -smp 4,sockets=3D1,dies=3D1,cores=3D2,threads=3D2 \
> -object iothread,id=3Diothread1 \
> -object iothread,id=3Diothread2 \
> -object iothread,id=3Diothread3 \
> -object iothread,id=3Diothread4 \
> -mem-prealloc \
> -mem-path /hugepages2M/libvirt/qemu/2-fedora \
> -numa node,nodeid=3D0,cpus=3D0,mem=3D4096 \
> -uuid 63840878-0deb-4095-97e6-fc444d9bc9fa \
> -no-user-config \
> -nodefaults \
> -chardev socket,id=3Dcharmonitor,fd=3D31,server,nowait \
> -mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
> -rtc base=3Dutc \
> -no-shutdown \
> -global PIIX4_PM.disable_s3=3D0 \
> -global PIIX4_PM.disable_s4=3D0 \
> -boot menu=3Don,strict=3Don \
> -device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 \
> -device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.0,addr=3D0x4 \
> -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.0,addr=3D0x5 \
> -blockdev
> '{"driver":"file","filename":"/var/lib/libvirt/images/fedora.qcow2","node=
-name":"libvirt-2-storage","auto-read-only":true,"discard":"unmap"}'
> \
> -blockdev
> '{"node-name":"libvirt-2-format","read-only":false,"discard":"unmap","dri=
ver":"qcow2","file":"libvirt-2-storage","backing":null}'
> \
> -device
> scsi-hd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,device_id=3Ddrive-s=
csi0-0-0-0,drive=3Dlibvirt-2-format,id=3Dscsi0-0-0-0,bootindex=3D1
> \
> -blockdev
> '{"driver":"nvme","device":"0000:02:00.0","namespace":1,"node-name":"libv=
irt-1-storage","auto-read-only":true,"discard":"unmap"}'
> \
> -blockdev
> '{"node-name":"libvirt-1-format","read-only":false,"driver":"raw","file":=
"libvirt-1-storage"}'
> \
> -device
> virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x6,drive=3Dlibvirt-1-format=
,id=3Dvirtio-disk0
> \
> -netdev tap,fd=3D33,id=3Dhostnet0,vhost=3Don,vhostfd=3D34 \
> -device
> virtio-net-pci,host_mtu=3D9000,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00=
:a4:6f:91,bus=3Dpci.0,addr=3D0x3
> \
> -chardev pty,id=3Dcharserial0 \
> -device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \
> -chardev socket,id=3Dcharchannel0,fd=3D35,server,nowait \
> -device
> virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchannel0,id=3D=
channel0,name=3Dorg.qemu.guest_agent.0
> \
> -spice port=3D5900,addr=3D0.0.0.0,disable-ticketing,seamless-migration=3D=
on \
> -device virtio-vga,id=3Dvideo0,virgl=3Don,max_outputs=3D1,bus=3Dpci.0,add=
r=3D0x2 \
> -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x7 \
> -sandbox
> on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=
=3Ddeny \
> -msg timestamp=3Don
>
> And these are the errors I see:
>
> 2020-02-14T09:06:18.183167Z qemu-system-x86_64: VFIO_MAP_DMA failed:
> Invalid argument
> 2020-02-14T09:10:49.753767Z qemu-system-x86_64: VFIO_MAP_DMA failed:
> Cannot allocate memory
> 2020-02-14T09:11:04.530344Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
> space left on device
> 2020-02-14T09:11:04.531087Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
> space left on device
> 2020-02-14T09:11:04.531230Z qemu-system-x86_64: VFIO_MAP_DMA failed: No
> space left on device
>
>
> I'm doing nothing with the disk inside the guest, but:
>
>    # dd if=3D/dev/vda of=3D/dev/null status=3Dprogress
>
> (the disk appears as /dev/vda in the guest). Surprisingly, I do not see
> these errors when I use the traditional PCI assignment (-device
> vfio-pci). My versions of kernel and qemu:
>
> moe ~ # uname -r
> 5.4.15-gentoo
> moe ~ # /home/zippy/work/qemu/qemu.git/x86_64-softmmu/qemu-system-x86_64
> --version
> QEMU emulator version 4.2.50 (v4.2.0-1439-g5d6542bea7-dirty)
> Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers
>
> Do you guys want me to file a bug?

As you already have all the information, and it is a simple
copy/paste, I'd say "yes"


