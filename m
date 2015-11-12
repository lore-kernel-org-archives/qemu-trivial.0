Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwuSc-0000dn-Jc
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 11:10:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZwuSa-0000cP-0s
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 11:10:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZwuSW-0008JH-3S
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 11:10:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZwuSS-0008Hf-94; Thu, 12 Nov 2015 11:10:44 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id CC267383AC9;
	Thu, 12 Nov 2015 16:10:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tACGAgdb010714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 12 Nov 2015 11:10:43 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A8C08303F90B; Thu, 12 Nov 2015 17:10:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Rodrigo Rebello <rprebello@gmail.com>
References: <1447337068-2448-1-git-send-email-rprebello@gmail.com>
Date: Thu, 12 Nov 2015 17:10:41 +0100
In-Reply-To: <1447337068-2448-1-git-send-email-rprebello@gmail.com> (Rodrigo
	Rebello's message of "Thu, 12 Nov 2015 12:04:28 -0200")
Message-ID: <87wptnfbb2.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/1] configure: use
	appropriate code fragment for -fstack-protector checks
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
X-List-Received-Date: Thu, 12 Nov 2015 16:10:53 -0000

Rodrigo Rebello <rprebello@gmail.com> writes:

> The check for stack-protector support consisted in compiling and linking
> the test program below (output by function write_c_skeleton()) with the
> compiler flag -fstack-protector-strong first and then with
> -fstack-protector-all if the first one failed to work:
>
>   int main(void) { return 0; }
>
> This caused false positives when using certain toolchains in which the
> compiler accepted -fstack-protector-strong but no support was provided
> by the C library, since for this stack-protector variant the compiler
> emits canary code only for functions that meet specific conditions
> (local arrays, memory references to local variables, etc.) and the code
> fragment under test included none of them (hence no stack protection
> code generated, no link failure).
>
> This fix changes the test program used for -fstack-protector checks to
> include a function that meets conditions which cause the compiler to
> generate canary code in all variants.
>
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

