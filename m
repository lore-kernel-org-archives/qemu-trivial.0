Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XtHQd-0007Jj-S2
	for mharc-qemu-trivial@gnu.org; Tue, 25 Nov 2014 09:49:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XtHQX-00077n-9H
	for qemu-trivial@nongnu.org; Tue, 25 Nov 2014 09:49:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XtHQS-0006i0-4m
	for qemu-trivial@nongnu.org; Tue, 25 Nov 2014 09:49:13 -0500
Received: from mail-la0-f46.google.com ([209.85.215.46]:36484)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XtHQR-0006hs-TV
	for qemu-trivial@nongnu.org; Tue, 25 Nov 2014 09:49:08 -0500
Received: by mail-la0-f46.google.com with SMTP id gd6so675256lab.5
	for <qemu-trivial@nongnu.org>; Tue, 25 Nov 2014 06:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=u9k1Lf/ceXaxdEWO9VQIYL5YyKLczr97nCCgjvGexRM=;
	b=TqVQZgF50h4dGxL/Y5H7RhnKyG3mC0eSHLqn++TZGGGcFRFq0uLF7cF47OLj6YS9H7
	diG7QNaRYTD63Pr/tiDAFWTi61b6TbzZfgKY27/w6RIkVcdBpm22GtbWd5S3rLigXepH
	JopRrwpcY1fg9v3VJCPrIdIB/50J08eGiJYi9z+whtlsUi5Yr6TqdONTZSPrgMKgIVzw
	MSzvUp13/tJVjFNIVcioGxyEQ4Lg9zo6boFz1d0b67c1kFfpLTMCDM8NDpGS9kn/Ztag
	gLSVqUzf692hDfNM/73ThHvMYlm4eodLMRmR0sMdYFSDX1lOFKfIxuPf6gChBb/n0vmm
	s92A==
X-Gm-Message-State: ALoCoQl5n6whVBuTn9m1GlX0bTTC1UNsxhaIF4cnRNMuxia02etCUVf+slJYfTYKrvIc7JhmOBu9
X-Received: by 10.112.189.10 with SMTP id ge10mr27142863lbc.23.1416926946986; 
	Tue, 25 Nov 2014 06:49:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.150.135 with HTTP; Tue, 25 Nov 2014 06:48:46 -0800 (PST)
In-Reply-To: <1416826240-12368-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1416826240-12368-1-git-send-email-zhang.zhanghailiang@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Nov 2014 14:48:46 +0000
Message-ID: <CAFEAcA-dEGxgAzgu7rFfzy+6G8pqxkCij+mN-idhz4293OB=hA@mail.gmail.com>
To: zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.46
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH v2] hw/arm/boot: fix uninitialized scalar
 variable warning reported by coverity
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
X-List-Received-Date: Tue, 25 Nov 2014 14:49:18 -0000

On 24 November 2014 at 10:50, zhanghailiang
<zhang.zhanghailiang@huawei.com> wrote:
> Coverity reports the 'size' may be used uninitialized, but that can't happen,
> because the caller has checked "if (binfo->dtb_filename || binfo->get_dtb)"
> before call 'load_dtb'.
>
> Here we simply remove the 'if (binfo->get_dtb)' to satisfy coverity.
>
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
> v2:
> - add a note to the doc comment for load_dtb (Peter Maydell)
>   Thanks for comment.



Applied to target-arm.next, thanks.

-- PMM

