Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RKqOz-0007aC-O8
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2011 07:51:41 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RKqOw-0007Om-02
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2011 07:51:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RKqOv-0005tz-1d
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2011 07:51:37 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:52286)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RKqOs-0005rm-I2; Mon, 31 Oct 2011 07:51:34 -0400
Received: by wwg7 with SMTP id 7so1501776wwg.10
	for <multiple recipients>; Mon, 31 Oct 2011 04:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=CBrNOE+amKUeAjpKqGP6MKIon6ktGzhC+1i4D0TVLaI=;
	b=w7sM0tcNmwsJd9JUTaMm+/gSCRZL6fTRZl4u61YjowQLjmxlZfFry9/TAbE8YFr1lv
	RGhUMQEmgk5NKsunlqbtj436Gf+QY/Lgpk6uJ0P3A0DAe8RdljHsy0Z08vFx4tLcSdfd
	o1lNviQXs7n2JgC+uX/kIKSwGBFFvIW93PGUE=
MIME-Version: 1.0
Received: by 10.227.208.77 with SMTP id gb13mr19505182wbb.4.1320061892859;
	Mon, 31 Oct 2011 04:51:32 -0700 (PDT)
Received: by 10.180.85.165 with HTTP; Mon, 31 Oct 2011 04:51:32 -0700 (PDT)
In-Reply-To: <1319791946-15602-3-git-send-email-armbru@redhat.com>
References: <1319791946-15602-1-git-send-email-armbru@redhat.com>
	<1319791946-15602-3-git-send-email-armbru@redhat.com>
Date: Mon, 31 Oct 2011 11:51:32 +0000
Message-ID: <CAJSP0QVPFkVBL3bzcvpVtOdqV+31VtoFKmQ51S13dBXX=FTVxA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, jvrao@linux.vnet.ibm.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/2] hw/9pfs: Supply missing va_end()
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
X-List-Received-Date: Mon, 31 Oct 2011 11:51:39 -0000

On Fri, Oct 28, 2011 at 9:52 AM, Markus Armbruster <armbru@redhat.com> wrot=
e:
> C99 7.15.1: Each invocation of the va_start and va_copy macros shall
> be matched by a corresponding invocation of the va_end macro in the
> same function.
>
> Spotted by Coverity. =A0Harmless on the (common) systems where va_end()
> does nothing.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> =A0hw/9pfs/virtio-9p.c | =A0 =A04 ++++
> =A01 files changed, 4 insertions(+), 0 deletions(-)

Thanks for this patch.  I looked at the surrounding code and it turns
out this entire function duplicates g_vasprintf() from glib.

I sent a patch to use g_vasprintf() and it therefore eliminates the
varargs issue.

Stefan

