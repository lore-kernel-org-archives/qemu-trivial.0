Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YT9AR-0005KC-DA
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 08:16:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YT9AL-00059W-Pc
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 08:16:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YT9AD-0005d1-8Q
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 08:16:45 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:50854)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YT9A9-0005cA-EV; Wed, 04 Mar 2015 08:16:33 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 47A994082A;
	Wed,  4 Mar 2015 16:16:32 +0300 (MSK)
Message-ID: <54F705B0.8040308@msgid.tls.msk.ru>
Date: Wed, 04 Mar 2015 16:16:32 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
	<1425023419-12244-3-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1425023419-12244-3-git-send-email-arei.gonglei@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 2/9] arm: fix memory leak
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
X-List-Received-Date: Wed, 04 Mar 2015 13:16:49 -0000

27.02.2015 10:50, arei.gonglei@huawei.com wrote:
[]
> @@ -565,6 +565,7 @@ static void create_flash(const VirtBoardInfo *vbi)
>              error_report("Could not load ROM image '%s'", bios_name);
>              exit(1);
>          }
> +        g_free(fn);
>      }
> =20
>      create_one_flash("virt.flash0", flashbase, flashsize);
>=20

This change introduces a compiler error:

hw/arm/virt.c: In function =91create_flash=92:
hw/arm/virt.c:568:16: error: passing argument 1 of =91g_free=92 discards =
=91const=92 qualifier from pointer target type [-Werror]
         g_free(fn);
                ^
/usr/include/glib-2.0/glib/gmem.h:69:7: note: expected =91gpointer=92 but=
 argument is of type =91const char *=92
 void  g_free           (gpointer  mem);
       ^

This is because just a few lines above, `fn' variable
is declared as `const char *', which obviously should
not be used with any *free() functions.

The solution is to remove `const' from the variable
declaration.

And a much more general solution is to actually test
patches before submitting them.  You obviously did not
test this series, having 3 errors in 9 patches, ie,
1/3 of your patches does not work...

Thanks,

/mjt

