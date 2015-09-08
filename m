Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZNo9-0003mU-EN
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 14:39:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZZNo6-0003j5-HM
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 14:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZZNo5-0002os-JH
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 14:39:50 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:56634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1ZZNo1-0002kn-DZ; Tue, 08 Sep 2015 14:39:45 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	4AC9511810AB; Tue,  8 Sep 2015 20:39:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id pb5x9oPawc3q; Tue,  8 Sep 2015 20:39:40 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (p54ACAAE4.dip0.t-ipconnect.de
	[84.172.170.228])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	B749F11810A3; Tue,  8 Sep 2015 20:39:39 +0200 (CEST)
Message-ID: <55EF2B6B.2010100@weilnetz.de>
Date: Tue, 08 Sep 2015 20:39:39 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1441708475-27578-1-git-send-email-berrange@redhat.com>
	<1917133616.27415210.1441720423804.JavaMail.zimbra@redhat.com>
In-Reply-To: <1917133616.27415210.1441720423804.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2] gtk: avoid redefining _WIN32_WINNT
	macro
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
X-List-Received-Date: Tue, 08 Sep 2015 18:39:51 -0000

Am 08.09.2015 um 15:53 schrieb Paolo Bonzini:
>=20
>=20
> ----- Messaggio originale -----
>> Da: "Daniel P. Berrange" <berrange@redhat.com>
>> A: qemu-devel@nongnu.org
>> Cc: "Gerd Hoffmann" <kraxel@redhat.com>, qemu-trivial@nongnu.org, "Pao=
lo Bonzini" <pbonzini@redhat.com>, "Stefan
>> Weil" <sw@weilnetz.de>, "Daniel P. Berrange" <berrange@redhat.com>
>> Inviato: Marted=C3=AC, 8 settembre 2015 12:34:35
>> Oggetto: [PATCH v2] gtk: avoid redefining _WIN32_WINNT macro
>>
>> When building for Mingw64 target on Fedora 22 a warning
>> is issued about _WIN32_WINNT being redefined.
>>
>> In file included from ui/gtk.c:40:0:
>> include/ui/gtk.h:5:0: warning: "_WIN32_WINNT" redefined
>>  # define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_=
TO_VSC
>>  */
>>   ^
>> In file included from
>> /usr/i686-w64-mingw32/sys-root/mingw/include/crtdefs.h:10:0,
>>                  from /usr/i686-w64-mingw32/sys-root/mingw/include/std=
io.h:9,
>>                  from
>>                  /home/berrange/src/virt/qemu/include/qemu/fprintf-fn.=
h:12,
>>                  from /home/berrange/src/virt/qemu/include/qemu-common=
.h:18,
>>                  from ui/gtk.c:37:
>> /usr/i686-w64-mingw32/sys-root/mingw/include/_mingw.h:225:0: note: thi=
s is
>> the location of the previous definition
>>  #define _WIN32_WINNT 0x502
>>  ^
>>
>> Rather than try to get MAPVK_VK_TO_VSC defined indirectly
>> by defining _WIN32_WINNT, instead just define it explicitly
>> if missing.
>>
>> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
>> ---
>>  include/ui/gtk.h | 4 ----
>>  ui/gtk.c         | 9 +++++++++
>>  2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/ui/gtk.h b/include/ui/gtk.h
>> index ee6dffd..0359333 100644
>> --- a/include/ui/gtk.h
>> +++ b/include/ui/gtk.h
>> @@ -1,10 +1,6 @@
>>  #ifndef UI_GTK_H
>>  #define UI_GTK_H
>> =20
>> -#ifdef _WIN32
>> -# define _WIN32_WINNT 0x0601 /* needed to get definition of MAPVK_VK_=
TO_VSC
>> */
>> -#endif
>> -
>>  #ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
>>  /* Work around an -Wstrict-prototypes warning in GTK headers */
>>  #pragma GCC diagnostic push
>> diff --git a/ui/gtk.c b/ui/gtk.c
>> index df2a79e..80d5c20 100644
>> --- a/ui/gtk.c
>> +++ b/ui/gtk.c
>> @@ -104,6 +104,15 @@
>>  #define GDK_KEY_Pause GDK_Pause
>>  #endif
>> =20
>> +/* Some older mingw versions lack this constant or have
>> + * it conditionally defined */
>> +#ifdef _WIN32
>> +# ifndef MAPVK_VK_TO_VSC
>> +#  define MAPVK_VK_TO_VSC 0
>> +# endif
>> +#endif
>> +
>> +
>>  #define HOTKEY_MODIFIERS        (GDK_CONTROL_MASK | GDK_MOD1_MASK)
>> =20
>>  static const int modifier_keycode[] =3D {
>> --
>> 2.4.3
>>
>>
>=20
> Nice, thanks!
>=20
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>=20

Thanks, applied to my Windows patch queue
(git://qemu.weilnetz.de/qemu.git wxx)

Stefan


