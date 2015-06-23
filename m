Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7NSm-0006mR-Rd
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 08:38:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z7NSk-0006ha-32
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 08:38:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z7NSd-00050L-2P
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 08:38:01 -0400
Received: from mail-vn0-f46.google.com ([209.85.216.46]:37711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z7NSc-000509-Ub
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 08:37:54 -0400
Received: by vnbf129 with SMTP id f129so1264605vnb.4
	for <qemu-trivial@nongnu.org>; Tue, 23 Jun 2015 05:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ijWmNfADR/Un5duT5URkP0ZbEollVm0OJrQoMS64BVY=;
	b=nNNtSYGq9SYGAPwx4pHzQ9KIX26SiX/JuNP6td9IomQj3MT0tgQdTp4kdMviuzZCHR
	n4M1Wzz+zU5GKvnMgsS2UPuMQRalkJ9BBtnQQsjvrFU5gLbRdkOlQA77yFNA0V4BFVUQ
	bFJWQTU2rZV6V9Qf5+NVNWOBNEs8Ire6ZZvGhBSimjL4Nah+4buMqRZnv3yqMOFURw9X
	Ip6+UKmTacEmw2639oLhcNY3DlJLW73ti3IMS5py4/ibmVB805qVRs3zJKIXsKy2kwQl
	da1lA4rOPfbTNxE+r4dzpMxaXHLlv3jlTBINuAZG49wCgw3SDbvqq5jZ9gEOBcEPEZPr
	zpvg==
X-Gm-Message-State: ALoCoQlX6I4R01ZoMRBj5WX5slLgzVWOrLtnJL5u3fRTDsTGLCIIErZC5nt+9ZBFFDK1oXHMgUXT
X-Received: by 10.52.113.97 with SMTP id ix1mr30909318vdb.1.1435063074519;
	Tue, 23 Jun 2015 05:37:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 23 Jun 2015 05:37:35 -0700 (PDT)
In-Reply-To: <58e7daaa2977c903b46c3b0dde64e81ce191b5d6.1435062620.git.mprivozn@redhat.com>
References: <58e7daaa2977c903b46c3b0dde64e81ce191b5d6.1435062620.git.mprivozn@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jun 2015 13:37:35 +0100
Message-ID: <CAFEAcA_AYg5okJgU61CYQasH9yY8rjsQQxpLq5xPvFyHLtJdgw@mail.gmail.com>
To: Michal Privoznik <mprivozn@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.46
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Properly order
 build targets 'all' and 'check'
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
X-List-Received-Date: Tue, 23 Jun 2015 12:38:03 -0000

On 23 June 2015 at 13:30, Michal Privoznik <mprivozn@redhat.com> wrote:
> I'm used to run 'make -j5 all check'. However, this is not possible in
> qemu because of the missing dependency in the Makefile. If I do that,
> tests are usually started with build and since not everything is built
> yet, they often fail too. Moreover, we should run test suite only
> after every binary we want to test has been built.
>
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index e7c5c3a..67eeb87 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -151,6 +151,7 @@ dummy := $(call unnest-vars,, \
>
>  ifneq ($(wildcard config-host.mak),)
>  include $(SRC_PATH)/tests/Makefile
> +check: all
>  endif
>  ifeq ($(CONFIG_SMARTCARD_NSS),y)
>  include $(SRC_PATH)/libcacard/Makefile

I'm having difficulty understanding the use of conditionals
in our makefile -- can you explain why inside this ifneq
rather than outside is the right place for this dependency?

thanks
-- PMM

