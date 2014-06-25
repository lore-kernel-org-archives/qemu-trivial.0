Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wzlju-0006Pi-CS
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jun 2014 07:51:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1Wzljm-0006Cg-Gt
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 07:51:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1Wzljg-0005TI-3r
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 07:51:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47592)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1Wzljf-0005TD-SR; Wed, 25 Jun 2014 07:51:32 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5PBpTow003418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 25 Jun 2014 07:51:29 -0400
Received: from nial.usersys.redhat.com (dhcp-1-126.brq.redhat.com
	[10.34.1.126])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5PBpRFu014011; Wed, 25 Jun 2014 07:51:28 -0400
Date: Wed, 25 Jun 2014 13:51:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20140625135126.64cc15d8@nial.usersys.redhat.com>
In-Reply-To: <87vbrpe4qa.fsf@blackfin.pond.sub.org>
References: <1403683241-20678-1-git-send-email-imammedo@redhat.com>
	<87vbrpe4qa.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-char: fix warning
 'res' may be used uninitialized
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
X-List-Received-Date: Wed, 25 Jun 2014 11:51:44 -0000

On Wed, 25 Jun 2014 11:08:29 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> 
> Broken in commit 9005b2a (author cc'ed).  Bites only when passed zero
> len, which seems unlikely.
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 

main motivation for the patch was to allow -Werror=all build pass.

