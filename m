Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTRRc-0004yV-Mw
	for mharc-qemu-trivial@gnu.org; Thu, 05 Mar 2015 03:47:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YTRRW-0004nR-Vu
	for qemu-trivial@nongnu.org; Thu, 05 Mar 2015 03:47:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YTRRV-0006AN-VC
	for qemu-trivial@nongnu.org; Thu, 05 Mar 2015 03:47:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YTRRM-00068P-2o; Thu, 05 Mar 2015 03:47:32 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t258lO7A009567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 5 Mar 2015 03:47:25 -0500
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t258lLLs004858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 5 Mar 2015 03:47:23 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4BC3F305E2A5; Thu,  5 Mar 2015 09:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gonglei <arei.gonglei@huawei.com>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
	<1425023419-12244-3-git-send-email-arei.gonglei@huawei.com>
	<54F705B0.8040308@msgid.tls.msk.ru> <54F7BEC9.1060204@huawei.com>
Date: Thu, 05 Mar 2015 09:47:21 +0100
In-Reply-To: <54F7BEC9.1060204@huawei.com> (Gonglei's message of "Thu, 5 Mar
	2015 10:26:17 +0800")
Message-ID: <87oao7zv8m.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel]  [PATCH 2/9] arm: fix memory leak
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
X-List-Received-Date: Thu, 05 Mar 2015 08:47:48 -0000

Gonglei <arei.gonglei@huawei.com> writes:

> On 2015/3/4 21:16, Michael Tokarev wrote:
[...]
>> And a much more general solution is to actually test
>> patches before submitting them.  You obviously did not
>> test this series, having 3 errors in 9 patches, ie,
>> 1/3 of your patches does not work...
>> 
> Apologize earnestly for troubling you. :(
>
> I just thought they are so trivial, meanwhile I hadn't arm compiling
> environment (lack of
> libfdt-dev), and assigned "--target-list=x86_64-softmmu" that moment.

Hard-won personal experience: the more trivial a change is, the more
likely I am to screw it up in some stupid way.

In other words: no change is too trivial to screw it up.

Corollary: no change is trivial enough to skip testing.

