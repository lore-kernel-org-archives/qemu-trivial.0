Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3sin-0007mz-6G
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 13:30:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:40546)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U3sik-0007gQ-8K
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 13:30:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1U3sij-0000hE-83
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 13:30:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1U3sig-0000gk-Im; Fri, 08 Feb 2013 13:30:42 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r18IUeDa023886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 8 Feb 2013 13:30:40 -0500
Received: from blackfin.pond.sub.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r18IUdDw016192; Fri, 8 Feb 2013 13:30:39 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id AC6C6200AA; Fri,  8 Feb 2013 19:30:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <1360340232-4670-1-git-send-email-armbru@redhat.com>
	<1360340232-4670-7-git-send-email-armbru@redhat.com>
	<20130208160058.1988648f@redhat.com>
Date: Fri, 08 Feb 2013 19:30:38 +0100
In-Reply-To: <20130208160058.1988648f@redhat.com> (Luiz Capitulino's message
	of "Fri, 8 Feb 2013 16:00:58 -0200")
Message-ID: <87k3qiejzl.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH for-1.4 v2 6/6] vl: Exit unsuccessfully
	on option argument syntax error
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
X-List-Received-Date: Fri, 08 Feb 2013 18:30:47 -0000

Luiz Capitulino <lcapitulino@redhat.com> writes:

> On Fri,  8 Feb 2013 17:17:12 +0100
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> We exit successfully after reporting syntax error for argument of
>> --sandbox and --add-fd.
>> 
>> We continue undaunted after reporting it for argument of --option-rom
>> and --object then.
>> 
>> Change all four to exit unsuccessfully, like the other options.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Luiz Capitulino <lcapitulino@redhat.com>
>
> What about qemu_opts_parse() call in QEMU_OPTION_boot?

You're right!  I fixed in my tree, but then the fix hid in a not-for-1.4
commit.  Will extract it for 1.4.

