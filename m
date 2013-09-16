Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VLaYr-0005ik-OY
	for mharc-qemu-trivial@gnu.org; Mon, 16 Sep 2013 11:18:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1VLYXJ-0006Fy-4d
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 09:08:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1VLYXD-0006uu-Rb
	for qemu-trivial@nongnu.org; Mon, 16 Sep 2013 09:08:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39022)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1VLYX3-0006tg-KX; Mon, 16 Sep 2013 09:08:01 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8GD7xaK004634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 16 Sep 2013 09:07:59 -0400
Received: from redhat.com (vpn1-5-147.ams2.redhat.com [10.36.5.147])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8GD7s9h028593
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Mon, 16 Sep 2013 09:07:57 -0400
Date: Mon, 16 Sep 2013 14:07:54 +0100
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Damien Millescamps <damien.millescamps@6wind.com>
Message-ID: <20130916130753.GM6005@redhat.com>
References: <1379336175-822-1-git-send-email-damien.millescamps@6wind.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1379336175-822-1-git-send-email-damien.millescamps@6wind.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Mon, 16 Sep 2013 11:18:01 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND] ivshmem: allow the
 sharing of hugepages
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Sep 2013 13:08:22 -0000

On Mon, Sep 16, 2013 at 02:56:15PM +0200, Damien Millescamps wrote:
> This patch permits to share memory areas that do not specifically belong to
> /dev/shm. In such case, the file must be already present when launching qemu.
> 
> A use case for this patch is sharing huge pages available through a
> hugetlbfs mountpoint.
> 
> Signed-off-by: Damien Millescamps <damien.millescamps@6wind.com>
> ---
>  docs/specs/ivshmem_device_spec.txt |    5 +++--
>  hw/misc/ivshmem.c                  |   10 +++++++---
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/specs/ivshmem_device_spec.txt b/docs/specs/ivshmem_device_spec.txt
> index 667a862..3137e60 100644
> --- a/docs/specs/ivshmem_device_spec.txt
> +++ b/docs/specs/ivshmem_device_spec.txt
> @@ -4,8 +4,9 @@ Device Specification for Inter-VM shared memory device
>  
>  The Inter-VM shared memory device is designed to share a region of memory to
>  userspace in multiple virtual guests.  The memory region does not belong to any
> -guest, but is a POSIX memory object on the host.  Optionally, the device may
> -support sending interrupts to other guests sharing the same memory region.
> +guest, but is a either a POSIX memory object or a mmap'd file (such as a
> +hugepage) on the host.  Optionally, the device may support sending interrupts
> +to other guests sharing the same memory region.
>  
>  
>  The Inter-VM PCI device
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index 2838866..9178ccc 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -762,9 +762,13 @@ static int pci_ivshmem_init(PCIDevice *dev)
>  
>          } else if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR,
>                          S_IRWXU|S_IRWXG|S_IRWXO)) < 0) {
> -            fprintf(stderr, "ivshmem: could not open shared file\n");
> -            exit(-1);
> -
> +            /* Try with open() in case the file is not in /dev/shm/
> +             * This is usefull for sharing hugepages for example */
> +            fd = open(s->shmobj, O_RDWR);
> +            if (fd < 0) {
> +                fprintf(stderr, "ivshmem: could not open shared file\n");
> +                exit(-1);
> +            }

IME this kind of auto-magical fallback behaviour is a bad idea. If we
want to support non-SHM files for the ivshmem device, then it should
be done with an explicit command line property. eg where we currently
have a 'size' and 'shm' property on the cli:

   -device ivshmem,size=24124324,shm=nameofshmobj

it could allow an alternative 'file' property to point to a pre-created
filename

   -device ivshmem,file=/some/file/path


Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://autobuild.org       -o-         http://search.cpan.org/~danberr/ :|
|: http://entangle-photo.org       -o-       http://live.gnome.org/gtk-vnc :|

