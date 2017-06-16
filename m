Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dLp38-0000FQ-GZ
	for mharc-qemu-trivial@gnu.org; Fri, 16 Jun 2017 07:04:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dLp32-0000Cs-2W
	for qemu-trivial@nongnu.org; Fri, 16 Jun 2017 07:04:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dLp2w-0002co-95
	for qemu-trivial@nongnu.org; Fri, 16 Jun 2017 07:04:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55334)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dLp2q-0002an-V5; Fri, 16 Jun 2017 07:04:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE91261BAA;
	Fri, 16 Jun 2017 11:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DE91261BAA
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com DE91261BAA
Received: from [10.36.116.94] (ovpn-116-94.ams2.redhat.com [10.36.116.94])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51AE783077;
	Fri, 16 Jun 2017 11:04:01 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Andrew Jones <drjones@redhat.com>,
	Juan Quintela <quintela@redhat.com>
References: <1496931482-29914-1-git-send-email-thuth@redhat.com>
	<4b0ebafd-46da-3ec9-7a43-c008ba90b32b@redhat.com>
	<0c96c64b-20ef-c0ef-3206-2a4ff713f6d9@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f22dfd0c-5781-0e82-f5df-2d3c14868669@redhat.com>
Date: Fri, 16 Jun 2017 13:03:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <0c96c64b-20ef-c0ef-3206-2a4ff713f6d9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 16 Jun 2017 11:04:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Move balloon.o,
 numa.o and bootdevice.o to common-obj-y
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Jun 2017 11:04:20 -0000

On 14.06.2017 13:25, Paolo Bonzini wrote:
> 
> 
> On 14/06/2017 13:18, Thomas Huth wrote:
>> On 08.06.2017 16:18, Thomas Huth wrote:
>>> There does not seem to be any target specific code in these files, so
>>> we can put them into "common-obj" instead of "obj" to compile them only
>>> once for all targets.
>>
>> Self-NACK: balloon.c uses kvm_enabled() which in turn depends on
>> CONFIG_KVM ... and that flag is target-specific, so balloon.o can not be
>> moved to common-obj right now.
>>
>> We should poison CONFIG_KVM for common code ... I'll have a look into
>> that...
> 
> No, your patch is okay.
> 
> #if defined CONFIG_KVM || !defined NEED_CPU_H
> #define kvm_enabled()           (kvm_allowed)
> ...
> #else
> #define kvm_enabled()           (0)
> 
> In other words, kvm_enabled() forces itself to be 0 only in per-target
> files.  This is done mostly to limit the number of required stubs:
> target-independent APIs can be called from compile-once files and must
> be stubbed; target-specific APIs can only be called from per-target
> files, and their calls are culled by the compiler if !CONFIG_KVM.

OK, thanks for the explanation!
... but I now think my patch is still wrong, due to another reason:
numa.o indirectly uses ram_addr_t variables, and these are target
specific, as far as I can see. So at least that file should not be moved
to common-obj-y.

 Thomas

