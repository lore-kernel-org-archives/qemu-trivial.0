Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y5PBP-0005Dd-D9
	for mharc-qemu-trivial@gnu.org; Sun, 28 Dec 2014 20:31:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tiejun.chen@intel.com>) id 1Y5PBN-0005Bd-Gn
	for qemu-trivial@nongnu.org; Sun, 28 Dec 2014 20:31:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tiejun.chen@intel.com>) id 1Y5PBM-0001to-Kr
	for qemu-trivial@nongnu.org; Sun, 28 Dec 2014 20:31:41 -0500
Received: from mga01.intel.com ([192.55.52.88]:63223)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tiejun.chen@intel.com>)
	id 1Y5PBH-0001rm-Me; Sun, 28 Dec 2014 20:31:35 -0500
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2014 17:31:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="505075742"
Received: from tiejunch-mobl.ccr.corp.intel.com (HELO [10.238.130.48])
	([10.238.130.48])
	by orsmga003.jf.intel.com with ESMTP; 28 Dec 2014 17:26:28 -0800
Message-ID: <54A0AEF2.3050300@intel.com>
Date: Mon, 29 Dec 2014 09:31:30 +0800
From: "Chen, Tiejun" <tiejun.chen@intel.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>,
	"Denis V. Lunev" <den-lists@parallels.com>
References: <1419581126-12927-1-git-send-email-tiejun.chen@intel.com>
	<CAFEAcA9yR2FPUF-T_ehMS4Yd0SL91mVADYwhDAuxCbkhQnNZiA@mail.gmail.com>
	<549D356A.4050506@parallels.com>
	<CAFEAcA_DTVFUE5QmU3T8DbuZQwhcXPhuxVfEYOTyST3sDL0-PQ@mail.gmail.com>
	<549EC79C.2090608@redhat.com>
In-Reply-To: <549EC79C.2090608@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
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
X-List-Received-Date: Mon, 29 Dec 2014 01:31:42 -0000


On 2014/12/27 22:52, Paolo Bonzini wrote:
>
>
> On 26/12/2014 18:59, Peter Maydell wrote:
>> Mm, but once you're into such microoptimisations as this you really
>> need to have a good justification for the effort, in the form of
>> profiling measurements that indicate that this is a hot path.
>> In this case that seems pretty unlikely, because I'd expect all
>> the systems where we care about performance will support irqfds,
>> so we won't be taking the early-exit code path anyhow. (And
>> not supporting irqfds is leaving much more performance on the
>> table than we could possibly be talking about in this function.)
>
> Also, it's even possible for a compiler to figure this out.  All in all,
> I don't see any advantage to this patch...
>

Indeed, its just a cleanup to make codes readable and comprehensible 
since oftentimes we don't initially write such a subsequent code just 
because we have this possibility to figure them out by the compiler, or 
others. And this is why I'm CCing Qemu trivial.

Tiejun

