Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYoju-0001ky-WA
	for mharc-qemu-trivial@gnu.org; Wed, 01 Feb 2017 01:49:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cYojs-0001ji-Nc
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2017 01:49:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cYojr-0005yn-Vf
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2017 01:49:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cYojl-0005y3-SG; Wed, 01 Feb 2017 01:49:49 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC3974E02A;
	Wed,  1 Feb 2017 06:49:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v116nmmb012918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 1 Feb 2017 01:49:49 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BDD731138645; Wed,  1 Feb 2017 07:49:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
References: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
	<87wpdbw2ki.fsf@dusky.pond.sub.org>
	<157b55c5-2927-5f4e-0c43-820abd75a6d2@redhat.com>
Date: Wed, 01 Feb 2017 07:49:46 +0100
In-Reply-To: <157b55c5-2927-5f4e-0c43-820abd75a6d2@redhat.com> (Paolo
	Bonzini's message of "Tue, 31 Jan 2017 18:27:10 -0500")
Message-ID: <874m0ejth1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 01 Feb 2017 06:49:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop QEMU_GNUC_PREREQ()
 checks for gcc older than 4.1
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
X-List-Received-Date: Wed, 01 Feb 2017 06:49:57 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 31/01/2017 12:40, Markus Armbruster wrote:
>>>  
>>>  #define QEMU_NORETURN __attribute__ ((__noreturn__))
>>>  
>>> -#if QEMU_GNUC_PREREQ(3, 4)
>>>  #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
>>> -#else
>>> -#define QEMU_WARN_UNUSED_RESULT
>>> -#endif
>> Should we inline this macro?
>> 
>>>  
>>> -#if QEMU_GNUC_PREREQ(4, 0)
>>>  #define QEMU_SENTINEL __attribute__((sentinel))
>>> -#else
>>> -#define QEMU_SENTINEL
>>> -#endif
>> Likewise.
>
> Why, since we don't do that for QEMU_NORETURN, QEMU_PACKED, etc.?

Because we do it for aligned, always_inline, constructor, format, mode,
noinline, and in places even noreturn and packed:

    $ git-grep __attribute__ | sed '/define/d;s/.*__attribute__ *((\([A-Za-z0-9_]*\).*/\1/' | sort -u

