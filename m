Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TipWc-0004CD-Gn
	for mharc-qemu-trivial@gnu.org; Wed, 12 Dec 2012 11:51:14 -0500
Received: from eggs.gnu.org ([208.118.235.92]:36473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1TipWV-0004By-HB
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2012 11:51:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1TipWN-0002hr-EV
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2012 11:51:07 -0500
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:34941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1TipWM-0002hC-T8
	for qemu-trivial@nongnu.org; Wed, 12 Dec 2012 11:50:59 -0500
Received: from /spool/local
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Thu, 13 Dec 2012 02:46:44 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 13 Dec 2012 02:46:43 +1000
Received: from d23relay03.au.ibm.com (d23relay03.au.ibm.com [9.190.235.21])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id BC1CF2CE804A;
	Thu, 13 Dec 2012 03:50:50 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	qBCGooop66060418; Thu, 13 Dec 2012 03:50:50 +1100
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	qBCGoo6G022859; Thu, 13 Dec 2012 03:50:50 +1100
Received: from skywalker.linux.vnet.ibm.com ([9.77.203.248])
	by d23av03.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	qBCGomSC022839; Thu, 13 Dec 2012 03:50:48 +1100
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <50C88C2B.2010901@redhat.com>
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
	<50759EEC.8070308@weilnetz.de> <50759F9E.3060800@redhat.com>
	<5075A0FF.3080904@weilnetz.de> <5075A420.10003@redhat.com>
	<5075A843.8020107@weilnetz.de> <5075A966.3090708@weilnetz.de>
	<871uh5tqr7.fsf@explorer.in.ibm.com> <5076BACC.7030309@redhat.com>
	<87y5hdejes.fsf@linux.vnet.ibm.com>
	<87obi8ew14.fsf@linux.vnet.ibm.com>
	<50BF4015.2050102@redhat.com> <50C88C2B.2010901@redhat.com>
User-Agent: Notmuch/0.14+166~ge7bd40a (http://notmuchmail.org) Emacs/24.3.50.1
	(x86_64-unknown-linux-gnu)
Date: Wed, 12 Dec 2012 22:20:47 +0530
Message-ID: <8762479pug.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 12121216-5490-0000-0000-000002A358CB
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.144
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	"M. Mohan Kumar" <mohan@in.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] virtfs-proxy-helper: check return code
	of setfsgid/setfsuid
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
X-List-Received-Date: Wed, 12 Dec 2012 16:51:13 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> Il 05/12/2012 13:37, Paolo Bonzini ha scritto:
>>> > I have tested the below patch. Currently i don't have a signed-off-by on
>>> > the patch. One change noted by mohan which I incorporated in the patch
>>> > is we need to call setresgid before calling setresuid. If you are ok
>>> > with this change I can send it upstream.
>> Yes, please.
>> 
>> Either your version without pointers or mine is okay for me.
>
> Ping?

Merged upstream with commit 9fd2ecdc8cb2dc1a8a7c57b6c9c60bc9947b6a73

-aneesh


