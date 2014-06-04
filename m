Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ws6VL-000519-Rb
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jun 2014 04:25:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ws6VE-0004xa-Ji
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 04:25:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ws6V8-00023A-F8
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 04:24:56 -0400
Received: from mail-lb0-f171.google.com ([209.85.217.171]:41364)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ws6V8-00022K-86
	for qemu-trivial@nongnu.org; Wed, 04 Jun 2014 04:24:50 -0400
Received: by mail-lb0-f171.google.com with SMTP id 10so4097883lbg.16
	for <qemu-trivial@nongnu.org>; Wed, 04 Jun 2014 01:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uFiOlZFtrulv1goc2vdpkMZA2yWj2zZzpTrVHLovs7A=;
	b=VsK+nA6/2oQov3XPHyLQ2WIt3sXohQqkQrBoJKpGLSbCGZ0IJ+swMLl/if3YHEYtSg
	AirkUxeVec8Fq6Xq1UOlE7Sq8Eeuj80/CAW/ffnr3NQ6LILL9TkRCHA6RdUTp9f/pWEP
	kaVcqvZp85SCfyIMZD20dt6ZV4gVFsVvP6l1mLjlvnkkQgaOdS1qT24fahxsWLFUZ3GG
	ni+aB2ynnmK0li0/Vo0y/s93VFdZ3LrowMl3eX6Li5s4pjFv4TsQhohMBztKzvkGmkhG
	SZJwNvr/Ec9qAxweoJFeKSTUIq61XdDOAmkHkHE6KuKL+Y/xY25p54/NzOtt0KXnVgf9
	P7qQ==
X-Gm-Message-State: ALoCoQlJTQUZG7JVMuUI1yTiI/kP3Yxt/0+Olmhu7ElEE81+W38YPOfhXRlbbfbFvDt+5+0TN2hS
X-Received: by 10.112.72.41 with SMTP id a9mr925223lbv.71.1401870289052; Wed,
	04 Jun 2014 01:24:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Wed, 4 Jun 2014 01:24:28 -0700 (PDT)
In-Reply-To: <1513018f45cbc2dfff157d5df1dc86246cf08843.1401845262.git.sam.bobroff@au1.ibm.com>
References: <1513018f45cbc2dfff157d5df1dc86246cf08843.1401845262.git.sam.bobroff@au1.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Jun 2014 09:24:28 +0100
Message-ID: <CAFEAcA_YRCkMRVCU6kCh5aMAU5GE83Cf2bAgYtC4VS0eZWw6WA@mail.gmail.com>
To: Sam Bobroff <sam.bobroff@au1.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.171
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] Makefile: Correct path
	in stripping tool binaries
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
X-List-Received-Date: Wed, 04 Jun 2014 08:25:02 -0000

On 4 June 2014 02:37, Sam Bobroff <sam.bobroff@au1.ibm.com> wrote:
> Allow "make install" to handle tool binaries that reside in
> sub-directories.
>
> Without this patch "make install" will fail if it needs to strip
> a tool binary (e.g. debugging is not enabled) that is installed
> from a subdirectory. An example is fsdev/virtfs-proxy-helper.
>
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
>  Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index d830483..9c23265 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -380,7 +380,7 @@ install-datadir install-localstatedir
>  ifneq ($(TOOLS),)
>         $(INSTALL_PROG) $(TOOLS) "$(DESTDIR)$(bindir)"
>  ifneq ($(STRIP),)
> -       $(STRIP) $(TOOLS:%="$(DESTDIR)$(bindir)/%")
> +       $(STRIP) $(foreach T,$(TOOLS),"$(DESTDIR)$(bindir)/$(notdir $T)")
>  endif
>  endif
>  ifneq ($(CONFIG_MODULES),)
> --
> 1.7.10.4

We should probably also do this on the other invocation of $(STRIP}
for installs into libexecdir.

thanks
-- PMM

