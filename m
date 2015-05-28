Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxwL8-0004XS-TQ
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:51:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwL5-0004S1-JT
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:51:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YxwL4-0004zS-B9
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:51:07 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YxwKy-0004wG-6X; Thu, 28 May 2015 07:51:00 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D371642715;
	Thu, 28 May 2015 14:50:58 +0300 (MSK)
Message-ID: <55670122.50101@msgid.tls.msk.ru>
Date: Thu, 28 May 2015 14:50:58 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>
	<1432811625-13392-3-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432811625-13392-3-git-send-email-zhaoshenglong@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 2/4] hw/alpha/dp264.c: Fix memory leak
	spotted by valgrind
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 28 May 2015 11:51:09 -0000

28.05.2015 14:13, Shannon Zhao =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>=20
> valgrind complains about:
> =3D=3D7055=3D=3D 58 bytes in 1 blocks are definitely lost in loss recor=
d 1,471 of 2,192
> =3D=3D7055=3D=3D    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgprel=
oad_memcheck-amd64-linux.so)
> =3D=3D7055=3D=3D    by 0x24410F: malloc_and_trace (vl.c:2556)
> =3D=3D7055=3D=3D    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.s=
o.0.3600.3)
> =3D=3D7055=3D=3D    by 0x64DEFD7: g_strndup (in /usr/lib64/libglib-2.0.=
so.0.3600.3)
> =3D=3D7055=3D=3D    by 0x650181A: g_vasprintf (in /usr/lib64/libglib-2.=
0.so.0.3600.3)
> =3D=3D7055=3D=3D    by 0x64DF0CC: g_strdup_vprintf (in /usr/lib64/libgl=
ib-2.0.so.0.3600.3)
> =3D=3D7055=3D=3D    by 0x64DF188: g_strdup_printf (in /usr/lib64/libgli=
b-2.0.so.0.3600.3)
> =3D=3D7055=3D=3D    by 0x242F81: qemu_find_file (vl.c:2121)
> =3D=3D7055=3D=3D    by 0x217A32: clipper_init (dp264.c:105)
> =3D=3D7055=3D=3D    by 0x2484DA: main (vl.c:4249)
>=20
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/alpha/dp264.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
> index 9fe7e8b..0c5395f 100644
> --- a/hw/alpha/dp264.c
> +++ b/hw/alpha/dp264.c
> @@ -56,6 +56,7 @@ static void clipper_init(MachineState *machine)
>      qemu_irq rtc_irq;
>      long size, i;
>      const char *palcode_filename;
> +    char *filename;
>      uint64_t palcode_entry, palcode_low, palcode_high;
>      uint64_t kernel_entry, kernel_low, kernel_high;
> =20
> @@ -102,18 +103,20 @@ static void clipper_init(MachineState *machine)
>         but one explicitly written for the emulation, we might as
>         well load it directly from and ELF image.  */
>      palcode_filename =3D (bios_name ? bios_name : "palcode-clipper");
> -    palcode_filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, palcode_f=
ilename);
> -    if (palcode_filename =3D=3D NULL) {
> +    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, palcode_filename)=
;
> +    if (filename =3D=3D NULL) {
>          hw_error("no palcode provided\n");
>          exit(1);
>      }
> -    size =3D load_elf(palcode_filename, cpu_alpha_superpage_to_phys,
> +    size =3D load_elf(filename, cpu_alpha_superpage_to_phys,
>                      NULL, &palcode_entry, &palcode_low, &palcode_high,
>                      0, EM_ALPHA, 0);
>      if (size < 0) {
> -        hw_error("could not load palcode '%s'\n", palcode_filename);
> +        hw_error("could not load palcode '%s'\n", filename);
> +        g_free(filename);

In a previous patch you _removed_ g_free() before exit(), here' you're
adding one.  I don't think there's any need to free things before exit(),
but at least we should be consistent, maybe at least within one series :)

>          exit(1);
>      }
> +    g_free(filename);

How about this:

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 9fe7e8b..f86e7bb 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -55,7 +55,7 @@ static void clipper_init(MachineState *machine)
     ISABus *isa_bus;
     qemu_irq rtc_irq;
     long size, i;
-    const char *palcode_filename;
+    char *palcode_filename;
     uint64_t palcode_entry, palcode_low, palcode_high;
     uint64_t kernel_entry, kernel_low, kernel_high;

@@ -101,8 +101,8 @@ static void clipper_init(MachineState *machine)
     /* Load PALcode.  Given that this is not "real" cpu palcode,
        but one explicitly written for the emulation, we might as
        well load it directly from and ELF image.  */
-    palcode_filename =3D (bios_name ? bios_name : "palcode-clipper");
-    palcode_filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, palcode_fil=
ename);
+    palcode_filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS,
+                                bios_name ? bios_name : "palcode-clipper=
");
     if (palcode_filename =3D=3D NULL) {
         hw_error("no palcode provided\n");
         exit(1);
@@ -114,6 +114,7 @@ static void clipper_init(MachineState *machine)
         hw_error("could not load palcode '%s'\n", palcode_filename);
         exit(1);
     }
+    g_free(palcode_filename);

     /* Start all cpus at the PALcode RESET entry point.  */
     for (i =3D 0; i < smp_cpus; ++i) {


I'm not saying it is better, it is just that we don't really
need the original basename of the file and hence don't need
second variable.

If you like it I'd apply it, of I'll apply your version
(without g_free() before exit).

Thanks,

/mjt

