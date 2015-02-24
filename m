Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQ8gd-0006Dg-Lh
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 01:09:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YQ8gb-0006AK-3G
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 01:09:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YQ8gV-0002qJ-8o
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 01:09:37 -0500
Received: from mail-la0-f43.google.com ([209.85.215.43]:44573)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YQ8gV-0002q9-2B
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 01:09:31 -0500
Received: by lams18 with SMTP id s18so23569924lam.11
	for <qemu-trivial@nongnu.org>; Mon, 23 Feb 2015 22:09:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=d3RJHk7x2HIjRct8M2atrZpLm9CyrmgEJGrSX7srXrI=;
	b=ZiHN1rsHrnWhGu2oXL1xVLBH2BKxjlYqAcsKmuz3muXWtuzKY00LbZvz3LNydTDo8C
	x9xA6cG5Asi6GYZaZ/HgqwQcMhc4XiaLFbgW2bHMaI6gWJbZHo4CmsbPf+t/IM8LR95M
	TobS8cqxBReXTkwbHaVHwFvwYbcPKELnZhkGxRJkpt0dUwWtm+JdRyp34v988GtC0/Py
	3HHNwuudZhiqdY9I5Ugi8OEvpBsBySuejVhthjNtacc4wSF4Vt/1KPtC96nnYiA4ElS0
	zHTcKgK1JDeeMeB9a8UqfHN4zK1qbHGOFirCgZyvzydOPrmNEgBM8DKeCMQC+mI0r1Kg
	hLlg==
X-Gm-Message-State: ALoCoQnDrAaV74IHg/l2LqxePN1fIH0LAlzJqwAilfvRhmHLG52MEfX+a6ijPp2xRVWkch1A+0Ms
MIME-Version: 1.0
X-Received: by 10.112.185.101 with SMTP id fb5mr13224679lbc.12.1424758170247; 
	Mon, 23 Feb 2015 22:09:30 -0800 (PST)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.25.163.2 with HTTP; Mon, 23 Feb 2015 22:09:30 -0800 (PST)
In-Reply-To: <A24CCA9D-484A-4AD0-A34C-8DFB6D891D7F@gmail.com>
References: <A24CCA9D-484A-4AD0-A34C-8DFB6D891D7F@gmail.com>
Date: Mon, 23 Feb 2015 22:09:30 -0800
X-Google-Sender-Auth: wJOpwex2LxuA5_SQIJ4RzeDZ2RU
Message-ID: <CAEgOgz5069y4H1PFTf6-09KNnv3iADrJOGRDgUN5PoB5gFe0Kw@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: =?UTF-8?Q?Jorge_Acereda_Maci=C3=A1?= <jacereda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.43
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix crash when connecting
	to VNC through websocket
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
X-List-Received-Date: Tue, 24 Feb 2015 06:09:38 -0000

The subject should read V2 as this is a resubmit. Use git format-patch
--subject-prefix=3D"PATCH v2".

On Mon, Feb 23, 2015 at 4:29 PM, Jorge Acereda Maci=C3=A1 <jacereda@gmail.c=
om> wrote:
> Please, forget my previous patch, worked somehow with Chrome but failed w=
ith Safari (with a good reason, the sent headers were incorrect). This one =
should be correct and simpler.
>

You should also start a fresh with your commit message content. Don't
mention discarded versions of the patch or changes in your patch
content. Just say what the patch does. Your v1 commit message looks
good and coulld probably be reused as-is.

> Signed-off-by: Jorge Acereda Macia <jacereda@gmail.com>
>
> ---

But you put you patch change log here, below the "---". This allows
reviewers to see your change information, but git will discard the
changlog on application of the final accepted version.

Regards,
Peter

>  ui/vnc-ws.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/ui/vnc-ws.c b/ui/vnc-ws.c
> index e304baf..d75950d 100644
> --- a/ui/vnc-ws.c
> +++ b/ui/vnc-ws.c
> @@ -207,8 +207,7 @@ static void vncws_send_handshake_response(VncState *v=
s, const char* key)
>      }
>
>      response =3D g_strdup_printf(WS_HANDSHAKE, accept);
> -    vnc_write(vs, response, strlen(response));
> -    vnc_flush(vs);
> +    vnc_client_write_buf(vs, (const uint8_t *)response, strlen(response)=
);
>
>      g_free(accept);
>      g_free(response);
> --
> 1.9.3 (Apple Git-50)
>
>
>

