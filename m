Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlIKv-0005PB-CG
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 09:10:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlIKp-0005GM-Oa
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 09:10:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlIKl-0007ba-Iy
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 09:10:19 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XlIKc-0007Qg-6c; Mon, 03 Nov 2014 09:10:06 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BE57240583;
	Mon,  3 Nov 2014 17:10:03 +0300 (MSK)
Message-ID: <54578CBB.9040306@msgid.tls.msk.ru>
Date: Mon, 03 Nov 2014 17:10:03 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<545752D6.5020605@msgid.tls.msk.ru> <54576972.2030506@huawei.com>
In-Reply-To: <54576972.2030506@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: pbonzini@redhat.com, Gerd Hoffmann <kraxel@redhat.com>, eblake@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v2 0/5] Trivial patch about qemu-char
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
X-List-Received-Date: Mon, 03 Nov 2014 14:10:24 -0000

03.11.2014 14:39, zhanghailiang wrote:
> On 2014/11/3 18:03, Michael Tokarev wrote:
>> 03.11.2014 12:44, zhanghailiang wrote:
>>> Patch 1~3 fix wrong check about in-parameter.
>>> The last two patches convert some open functions to use Error API.
>>>
>>> v2:
>>> - don't use error_setg when followed by exit(), it does not report an=
 error (Eric Blake)
>>> - check the parameter in qemu_chr_parse_* functions and remove the ch=
eck in qemu_chr_open_* functions. (Michael Tokarev)
>>>
>>> Thanks very much for their reviews and suggestions;)
>>
>> Thank you for doing all this.  I think I can apply this but with foldi=
ng
>> patches 1 and 2 into one, -- it is better to see them both in the same
>> context, just like you did in patch 3.  If that's okay with you, I'll
>> just apply it like this.
>=20
> Sure, I'm Ok with it;)

I myself also prefer to use construct like !str[0] in place of strlen(str=
) !=3D 0,
to mean we check for its emptiness, we don't really need its lenght.  But=
 it is
not a probem at all, just a matter of persona preference.

I suggest mergeing the two commits into one, and also fix grammar erros
in the commit message, something like this (fell free to use this
commit message to the combined commit):

    qemu-char: fix parameter check in some qemu_chr_parse_* functions

    For some qemu_chr_parse_* functions, we just check whether the parame=
ter
    is NULL or not, but do not check if it is empty.

    For example:
     qemu-system-x86_64 -chardev pipe,id=3Did,path=3D
    It will pass the check of NULL but will not find the error until
    trying to open it, while essentially missing and empty parameter
    is the same thing.

    So we should find the error by checking parameter length, just like
    what qemu_chr_parse_udp does, it will help to find what exactly is
    wrong.

    So check the parameters for emptiness too, and avoid emptiness
    check at open time.

    Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
    Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>


[error API]
>=20
> Yes, this confused me, besides, error_setg will add a '\n' in the end, =
but
> for example, print_allowed_subtypes where use fprintf(stderr,..) withou=
t '\n' in the middle places,
> IMHO, maybe it makes sense to return this to the higher caller.

Oh.  I overlooked this one.  Indeed, this should not be done this way,
you can't print_allowed_subtypes() in there _before_ reporting actual
error, that'd be wrong.  Oh well :)

In this context, print_allowed_subtypes() should return a single string
with all subtypes in it.  I don't think it is interesting to print this
allowed_subtypes list in case no subtype is specified to start with,
but for invalid subtype it can be handled by adding the list to the
original error message (note we already have the list handy in this
function).  Something like this (on top of the original code, untested):

diff --git a/spice-qemu-char.c b/spice-qemu-char.c
index 8106e06..0acc9e5 100644
--- a/spice-qemu-char.c
+++ b/spice-qemu-char.c
@@ -244,23 +244,6 @@ static void spice_chr_fe_event(struct CharDriverStat=
e *chr, int event)
 #endif
 }

-static void print_allowed_subtypes(void)
-{
-    const char** psubtype;
-    int i;
-
-    fprintf(stderr, "allowed names: ");
-    for(i=3D0, psubtype =3D spice_server_char_device_recognized_subtypes=
();
-        *psubtype !=3D NULL; ++psubtype, ++i) {
-        if (i =3D=3D 0) {
-            fprintf(stderr, "%s", *psubtype);
-        } else {
-            fprintf(stderr, ", %s", *psubtype);
-        }
-    }
-    fprintf(stderr, "\n");
-}
-
 static CharDriverState *chr_open(const char *subtype,
     void (*set_fe_open)(struct CharDriverState *, int))

@@ -288,21 +271,31 @@ static CharDriverState *chr_open(const char *subtyp=
e,

 CharDriverState *qemu_chr_open_spice_vmc(const char *type)
 {
-    const char **psubtype =3D spice_server_char_device_recognized_subtyp=
es();
+    const char **subtype_list =3D spice_server_char_device_recognized_su=
btypes();
+    const char **psubtype;

     if (type =3D=3D NULL) {
         fprintf(stderr, "spice-qemu-char: missing name parameter\n");
-        print_allowed_subtypes();
         return NULL;
     }
-    for (; *psubtype !=3D NULL; ++psubtype) {
+    for (psubtype =3D subtype_list; *psubtype !=3D NULL; ++psubtype) {
         if (strcmp(type, *psubtype) =3D=3D 0) {
             break;
         }
     }
     if (*psubtype =3D=3D NULL) {
-        fprintf(stderr, "spice-qemu-char: unsupported type: %s\n", type)=
;
-        print_allowed_subtypes();
+        char *subtypes;
+        int len;
+        for(len =3D 1, psubtype =3D subtype_list; *psubtype; ++psubtype)=
 {
+            len +=3D strlen(*psubtype) + (psubtypes <> psubtype);
+        }
+        subtypes =3D g_alloc(len);
+        for(len =3D 0, psubtype =3D subtype_list; *psubtype; ++psubtype)=
 {
+            len +=3D sprintf(subtypes + len, "%s%s",
+                           psubtypes <> psubtype ? "," : "", *psubtype);
+        }
+        fprintf(stderr, "spice-qemu-char: unsupported type: %s, allowed =
types: %s\n", type, subtypes);
+        g_free(subtypes);
         return NULL;
     }
[]
In another reply, to patch 5:

>> Now this is funny.  Why we have two functions nearby using different
>> error reporting APIs?  Maybe qemu_chr_open_spice_port() should be
>> converted to Error API too, at the same time (maybe in the same
>> patch or in a subsequent patch in the same series)?
>
> Actually, after patch 3, there will be no error case for this function,=
 it can not
> fail, so i just leave it. What's your opinion? Thanks.

Okay, I haven't realized it.  Yes, that makes sense.

[]
> It's okay, So what's your opinion about this series?
> Should i merge patch 1 and 2 into one patch in V3?
> Keep the other modifies except the incorrect modify in qemu_chr_open_pt=
y for patch 4?
> If yes, i will send V3;)

I was ready to merge these but realized I shouldn't because that'll be
too much on my part, only adding to your confusion - which part is
applied and which is not, etc.

So please do a V3, to have common base for all this.

I'm not sure if the print_allowed_subtypes() thing is a good idea actuall=
y --
it is a bit too large, but without it we can't just convert things as you
tried to do, for hopefully obvious reasons.  Maybe asking spice maintaine=
r
for the opinion is a good idea? (Cc'ing Gerd).  The context is, for examp=
le,
here: http://lists.nongnu.org/archive/html/qemu-devel/2014-11/msg00187.ht=
ml .

This patch also has somewhat large list of conversions of other errors in
windows part of the code, and these all really look terrible, this is not
correct english really, as far as I know -- it is either "Failed _to_ do
something", or "something failed", but not "failed something".. ;)  I'm
not, again, sure that's a good idea to leave it as it is, maybe at least
some context in the error message will help... ;)

Thank you!

/mjt

