Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZIdD-0008Ug-EB
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 09:08:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZZIdB-0008S8-8j
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 09:08:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZZIdA-0005ph-Cd
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 09:08:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZZId6-0005mY-2k; Tue, 08 Sep 2015 09:08:08 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id A83628F301;
	Tue,  8 Sep 2015 13:08:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
	[10.36.116.30])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t88D85X7015566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 8 Sep 2015 09:08:07 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5142A300111B; Tue,  8 Sep 2015 15:08:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1441621264-23812-1-git-send-email-pbonzini@redhat.com>
	<87h9n5p3ou.fsf@blackfin.pond.sub.org>
	<1829681137.27366603.1441716293187.JavaMail.zimbra@redhat.com>
Date: Tue, 08 Sep 2015 15:08:05 +0200
In-Reply-To: <1829681137.27366603.1441716293187.JavaMail.zimbra@redhat.com>
	(Paolo Bonzini's message of "Tue, 8 Sep 2015 08:44:53 -0400 (EDT)")
Message-ID: <87io7lkqiy.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] add macro file for
	coccinelle
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
X-List-Received-Date: Tue, 08 Sep 2015 13:08:14 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

>> > +/* From qemu/compiler.h */
>> > +#define QEMU_GNUC_PREREQ(maj, min) 1
>> > +#define QEMU_NORETURN __attribute__ ((__noreturn__))
>> > +#define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
>> > +#define QEMU_SENTINEL __attribute__((sentinel))
>> > +#define QEMU_ARTIFICIAL __attribute__((always_inline, artificial))
>> > +#define QEMU_PACKED __attribute__((gcc_struct, packed))
>> > +
>> > +#define cat(x,y) x ## y
>> > +#define cat2(x,y) cat(x,y)
>> 
>> Why not reuse glue()?
>
> Because the duplication is already in compiler.h, which should
> use glue() instead of cat2().  Separate patch IMHO, but thanks
> for noticing. :-)

The separate patch is commit 24134c4 :)

