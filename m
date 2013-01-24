Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TyK5N-0000ET-UK
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2013 05:31:09 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1TyK5K-0008VO-JS
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2013 05:31:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1TyK5I-0002HU-S1
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2013 05:31:06 -0500
Received: from mail-lb0-f177.google.com ([209.85.217.177]:59083)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1TyK5D-0002GV-Eb; Thu, 24 Jan 2013 05:30:59 -0500
Received: by mail-lb0-f177.google.com with SMTP id go11so2995261lbb.36
	for <multiple recipients>; Thu, 24 Jan 2013 02:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=Q9Y7E1kGoETlS1jIxq0IgP0lTx10OwkxlfZFxYm02jA=;
	b=GfKh5uq+Wn0Wa2Mu2BVaBVTwFtCJ0QePdpDXrDF43X01V6YYQbWwG13Pkdw0V8RQ/b
	OdFwePVZeBdhL1uxY++LJSDKesaTfAVL+qbLlsBJ8XH+uhGFXSQvBMvAsDzm+i4283uU
	dMzDBdbOdFMABhuVDzf96cD9gz4y0hkavq1Uw5sH7e9KmnnT/6aKyFb0645t5lcr0n06
	nVVwtX+6zPp0MDr/HMxeUVdYX/4yQLAD+L1wRLBRosrBohkeEZwC5uuHbQUpZc/ApRnC
	7uBFU3paKNjVgCl+EmFpYkK4mhYVFrhod4xUH9SbvUeE1k5QW2WYpLF9de0m6JJxEkBi
	/RBQ==
X-Received: by 10.152.109.176 with SMTP id ht16mr1400384lab.2.1359023458182;
	Thu, 24 Jan 2013 02:30:58 -0800 (PST)
Received: from localhost (rocksteady.se.axis.com. [195.60.68.156])
	by mx.google.com with ESMTPS id pk1sm5650136lab.0.2013.01.24.02.30.57
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 02:30:57 -0800 (PST)
Date: Thu, 24 Jan 2013 11:30:55 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Message-ID: <20130124103055.GB10808@edde.se.axis.com>
References: <1359021107-29413-1-git-send-email-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1359021107-29413-1-git-send-email-afaerber@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.217.177
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH for-1.4] target-cris: Fix typo in D_LOG()
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
X-List-Received-Date: Thu, 24 Jan 2013 10:31:08 -0000

On Thu, Jan 24, 2013 at 10:51:47AM +0100, Andreas Färber wrote:
> It's __VAR_ARGS__. Fixes the build with CRIS_[OP_]HELPER_DEBUG defined.
> 
> Broken since r6338 / 93fcfe39a0383377e647b821c9f165fd927cd4e0 (Convert
> references to logfile/loglevel to use qemu_log*() macros).

Applied, thanks!


> 
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  target-cris/helper.c    |    2 +-
>  target-cris/op_helper.c |    2 +-
>  2 Dateien geändert, 2 Zeilen hinzugefügt(+), 2 Zeilen entfernt(-)
> 
> diff --git a/target-cris/helper.c b/target-cris/helper.c
> index 8407a6d..6e75e98 100644
> --- a/target-cris/helper.c
> +++ b/target-cris/helper.c
> @@ -28,7 +28,7 @@
>  
>  #ifdef CRIS_HELPER_DEBUG
>  #define D(x) x
> -#define D_LOG(...) qemu_log(__VA__ARGS__)
> +#define D_LOG(...) qemu_log(__VA_ARGS__)
>  #else
>  #define D(x)
>  #define D_LOG(...) do { } while (0)
> diff --git a/target-cris/op_helper.c b/target-cris/op_helper.c
> index 79bff38..0f6a1ee 100644
> --- a/target-cris/op_helper.c
> +++ b/target-cris/op_helper.c
> @@ -28,7 +28,7 @@
>  
>  #ifdef CRIS_OP_HELPER_DEBUG
>  #define D(x) x
> -#define D_LOG(...) qemu_log(__VA__ARGS__)
> +#define D_LOG(...) qemu_log(__VA_ARGS__)
>  #else
>  #define D(x)
>  #define D_LOG(...) do { } while (0)
> -- 
> 1.7.10.4
> 

