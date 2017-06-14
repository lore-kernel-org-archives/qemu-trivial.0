Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dL6Qm-0006sR-Ql
	for mharc-qemu-trivial@gnu.org; Wed, 14 Jun 2017 07:25:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dL6Ql-0006qx-3T
	for qemu-trivial@nongnu.org; Wed, 14 Jun 2017 07:25:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dL6Qk-00085m-3I
	for qemu-trivial@nongnu.org; Wed, 14 Jun 2017 07:25:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47676)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dL6Qf-00084Q-0g; Wed, 14 Jun 2017 07:25:41 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0825080C0A;
	Wed, 14 Jun 2017 11:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0825080C0A
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0825080C0A
Received: from [10.36.116.244] (ovpn-116-244.ams2.redhat.com [10.36.116.244])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v5EBPaQQ001148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 14 Jun 2017 07:25:38 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Andrew Jones <drjones@redhat.com>,
	Juan Quintela <quintela@redhat.com>
References: <1496931482-29914-1-git-send-email-thuth@redhat.com>
	<4b0ebafd-46da-3ec9-7a43-c008ba90b32b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0c96c64b-20ef-c0ef-3206-2a4ff713f6d9@redhat.com>
Date: Wed, 14 Jun 2017 13:25:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <4b0ebafd-46da-3ec9-7a43-c008ba90b32b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 14 Jun 2017 11:25:40 +0000 (UTC)
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
X-List-Received-Date: Wed, 14 Jun 2017 11:25:48 -0000



On 14/06/2017 13:18, Thomas Huth wrote:
> On 08.06.2017 16:18, Thomas Huth wrote:
>> There does not seem to be any target specific code in these files, so
>> we can put them into "common-obj" instead of "obj" to compile them only
>> once for all targets.
> 
> Self-NACK: balloon.c uses kvm_enabled() which in turn depends on
> CONFIG_KVM ... and that flag is target-specific, so balloon.o can not be
> moved to common-obj right now.
> 
> We should poison CONFIG_KVM for common code ... I'll have a look into
> that...

No, your patch is okay.

#if defined CONFIG_KVM || !defined NEED_CPU_H
#define kvm_enabled()           (kvm_allowed)
...
#else
#define kvm_enabled()           (0)

In other words, kvm_enabled() forces itself to be 0 only in per-target
files.  This is done mostly to limit the number of required stubs:
target-independent APIs can be called from compile-once files and must
be stubbed; target-specific APIs can only be called from per-target
files, and their calls are culled by the compiler if !CONFIG_KVM.

Paolo

