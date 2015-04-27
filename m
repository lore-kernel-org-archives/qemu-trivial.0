Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmnVH-0003sW-Im
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 14:11:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YmnVF-0003mb-9X
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 14:11:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YmnVB-0005n8-2p
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 14:11:33 -0400
Received: from mail-qc0-f173.google.com ([209.85.216.173]:33146)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1YmnVA-0005mv-VX
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 14:11:29 -0400
Received: by qcrf4 with SMTP id f4so58961747qcr.0
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 11:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=4AFu3aoHp7BVEsSKMh+ShonRXj3Pwt8oVF6/yA9Iro4=;
	b=P9LFOfVRV20nym1Ne/e8q+6bBv1NfD0GiWMQYiD5Tzr+iO0KM+KA+TWM+igSyl094p
	aJ0YjAQuUMgzimRtybXoOkJL18iz78fk8j/PQKzXigL8N4RJi9FKIHJQkGpy7W3Euk4t
	aPkdkY8DHxblSU95SlJ4BJwBxSMzl05duK7A/rItGcbfN4Ulb9t/xkBgywAXwXuArbIN
	u0p08954HHeXYYlM/Tn2sQSi5w+LGxyLvv5hAoAbiDEWactg/0O1skU71jlXUi/P3joY
	gwGjusBvTheT0mM9BpghptT5usLQZcCCfdvzanqh/t9qhkpiT0iw0Y5qeZ32lxF9QyiZ
	nlUA==
X-Gm-Message-State: ALoCoQnsubsvmMR9Ys7HmYRqz2REGPzBUfe6VQ19cwO8+LRAQz5CG9iu970h9T+vJYDtmyvOWkki
MIME-Version: 1.0
X-Received: by 10.55.23.78 with SMTP id i75mr13328954qkh.82.1430158288580;
	Mon, 27 Apr 2015 11:11:28 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.96.97.41 with HTTP; Mon, 27 Apr 2015 11:11:28 -0700 (PDT)
In-Reply-To: <1430153133-30988-5-git-send-email-cota@braap.org>
References: <1430153133-30988-1-git-send-email-cota@braap.org>
	<1430153133-30988-5-git-send-email-cota@braap.org>
Date: Mon, 27 Apr 2015 11:11:28 -0700
X-Google-Sender-Auth: Y5Bgrh0JJ0R2AkSNM4f4Ski08GQ
Message-ID: <CAEgOgz5LL=9EChHirsppPBVqP4vM2td5ZMdm+1g_tAsTo2WejQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: "Emilio G. Cota" <cota@braap.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/6] gitignore: ignore
	*.patch files
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
X-List-Received-Date: Mon, 27 Apr 2015 18:11:34 -0000

On Mon, Apr 27, 2015 at 9:45 AM, Emilio G. Cota <cota@braap.org> wrote:
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitignore b/.gitignore
> index aed0e1f..025a841 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -62,6 +62,7 @@
>  *.fn
>  *.ky
>  *.log
> +*.patch

This Issue is discussed and I think it was concluded to not gitignore
patches. See:

commit f3a22014e94dfaacb57277dafce66b41cd994869
Author: Michael Tokarev <mjt@tls.msk.ru>
Date:   Thu Jun 6 01:14:54 2013 +0400

    gitignore: unignore *.patch

    This partially reverts:

     commit 082369e62c5bbaba89f173c2b803bc24115bb111
     Author: liguang <lig.fnst@cn.fujitsu.com>
     Date:   Fri Mar 22 16:44:13 2013 +0800

        gitignore: ignore more files

    I'm not sure how this went in.  The thing is that
    ignoring *.patch, in my opinion, is just wrong.
    Especially for downstreams who apply patches for
    real.

    Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>


Regards,
Peter


>  *.pdf
>  *.pod
>  *.cps
> --
> 1.9.1
>
>

