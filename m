Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlETy-0006PM-7S
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 05:03:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlETq-0006Fg-Da
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 05:03:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XlETk-0007iR-9k
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 05:03:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48600)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XlETX-0007eg-Qn; Mon, 03 Nov 2014 05:03:03 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 35051404DE;
	Mon,  3 Nov 2014 13:03:02 +0300 (MSK)
Message-ID: <545752D6.5020605@msgid.tls.msk.ru>
Date: Mon, 03 Nov 2014 13:03:02 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.2.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1415007872-8228-1-git-send-email-zhang.zhanghailiang@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: pbonzini@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
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
X-List-Received-Date: Mon, 03 Nov 2014 10:03:29 -0000

03.11.2014 12:44, zhanghailiang wrote:
> Patch 1~3 fix wrong check about in-parameter.
> The last two patches convert some open functions to use Error API.
>=20
> v2:
> - don't use error_setg when followed by exit(), it does not report an e=
rror (Eric Blake)
> - check the parameter in qemu_chr_parse_* functions and remove the chec=
k in qemu_chr_open_* functions. (Michael Tokarev)
>=20
> Thanks very much for their reviews and suggestions;)

Thank you for doing all this.  I think I can apply this but with folding
patches 1 and 2 into one, -- it is better to see them both in the same
context, just like you did in patch 3.  If that's okay with you, I'll
just apply it like this.

Speaking of Error API -- what is the general consensus of this?  We have
TONS of various way to report errors now, and we had several incarnations
of various error APIs too, are we going to use some common API finally,
or is the conversion endless, expecting new APIs to arrive?

And one more thing.  Patch 4 does this:

@@ -1388,8 +1388,8 @@ static CharDriverState *qemu_chr_open_pty(const cha=
r *id,
     ret->pty =3D g_strdup(pty_name);
     ret->has_pty =3D true;

-    fprintf(stderr, "char device redirected to %s (label %s)\n",
-            pty_name, id);
+    error_report("char device redirected to %s (label %s)",
+                 pty_name, id);

     s =3D g_malloc0(sizeof(PtyCharDriver));
     chr->opaque =3D s;

This is not really correct.  First it is not really an error, it is
an informational message.  But also, there are many scripts out there
who expects this very format of this message to find the entry to
that char device.  Converting this message to error_report() changes
its format, so scrips will be unable to find the device anymore.

Take a look at history of this place, -- I remember there was a rather
hot discussion when the last part, "(label %)", has been added (initial
message was without this label).  Initial suggestion was to change
wordin to 'char device $LABEL redirected to $DEVICE', but even if it
is much more readable and correct, we agreed to add that "label" part
to the end - not that it preserves original message, but at least it
makes less scripts to fail...

So at least this hunk should not be applied.  I think this place
deserves a comment.

I'm sorry for being so picky, but I think I give enough reasons
explaining why, and these reasons are serious enough.

Thanks,

/mjt

