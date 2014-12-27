Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y4sjC-0001yu-3O
	for mharc-qemu-trivial@gnu.org; Sat, 27 Dec 2014 09:52:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Y4sj9-0001wd-T9
	for qemu-trivial@nongnu.org; Sat, 27 Dec 2014 09:52:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Y4sj9-0006BG-6v
	for qemu-trivial@nongnu.org; Sat, 27 Dec 2014 09:52:23 -0500
Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233]:47849)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Y4sj3-00069B-Sp; Sat, 27 Dec 2014 09:52:18 -0500
Received: by mail-wg0-f51.google.com with SMTP id x12so15772223wgg.24;
	Sat, 27 Dec 2014 06:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=iIVz2HYXcH/nUTOFLR6CmxFiehRUH9pyL3yz3fuVSFw=;
	b=0uJmdd8h58K/wGACc7Gm18EgoLqvpKk4MNTvI9f7/JW+ukRO/JlCi+boYa+2IhcUvV
	v9Xrk//8KBbmRyT7SrAkZf+H9vygxrHTGm0RD4AmbxYvEch1zSp21KL72bCjbv4z4jrx
	OKUZ3Wy+5WIZk98znZBVRHFksFsErNTJoy1EGAcJotav1Y80+nFd4h1NLNyLvIOg8G02
	8DLy9pv2Q0C17CHN2NOmnNz2L+T2Fcrpg80meZi5gPLi9evXz9HmHG0dcP3ml8e3jEGA
	Ws1U37Q5+ZspFJrq+saKD8aU2+HkzsSQk5O3R9KaZ8B3gA5diU5RBlngkuIi+a6qhXnS
	l5Hg==
X-Received: by 10.180.81.7 with SMTP id v7mr77643523wix.74.1419691936157;
	Sat, 27 Dec 2014 06:52:16 -0800 (PST)
Received: from [192.168.10.150] (net-37-117-147-67.cust.vodafonedsl.it.
	[37.117.147.67]) by mx.google.com with ESMTPSA id
	eu15sm32040675wid.18.2014.12.27.06.52.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Dec 2014 06:52:15 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <549EC79C.2090608@redhat.com>
Date: Sat, 27 Dec 2014 15:52:12 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.kvm.devel,gmane.comp.emulators.qemu
To: Peter Maydell <peter.maydell@linaro.org>, 
	"Denis V. Lunev" <den-lists@parallels.com>
References: <1419581126-12927-1-git-send-email-tiejun.chen@intel.com>
	<CAFEAcA9yR2FPUF-T_ehMS4Yd0SL91mVADYwhDAuxCbkhQnNZiA@mail.gmail.com>
	<549D356A.4050506@parallels.com>
	<CAFEAcA_DTVFUE5QmU3T8DbuZQwhcXPhuxVfEYOTyST3sDL0-PQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_DTVFUE5QmU3T8DbuZQwhcXPhuxVfEYOTyST3sDL0-PQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::233
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Tiejun Chen <tiejun.chen@intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>, kvm-devel <kvm@vger.kernel.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] kvm_irqchip_assign_irqfd:
 just set irqfd in case of kvm_irqfds_enabled()
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
X-List-Received-Date: Sat, 27 Dec 2014 14:52:24 -0000



On 26/12/2014 18:59, Peter Maydell wrote:
> Mm, but once you're into such microoptimisations as this you really
> need to have a good justification for the effort, in the form of
> profiling measurements that indicate that this is a hot path.
> In this case that seems pretty unlikely, because I'd expect all
> the systems where we care about performance will support irqfds,
> so we won't be taking the early-exit code path anyhow. (And
> not supporting irqfds is leaving much more performance on the
> table than we could possibly be talking about in this function.)

Also, it's even possible for a compiler to figure this out.  All in all,
I don't see any advantage to this patch...

Paolo

