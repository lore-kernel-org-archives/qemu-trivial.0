Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TgEEo-00061n-0z
	for mharc-qemu-trivial@gnu.org; Wed, 05 Dec 2012 07:38:06 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1TgEEe-0005za-UN
	for qemu-trivial@nongnu.org; Wed, 05 Dec 2012 07:38:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1TgEEZ-00012k-5P
	for qemu-trivial@nongnu.org; Wed, 05 Dec 2012 07:37:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:10267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1TgEEY-00012e-Th; Wed, 05 Dec 2012 07:37:51 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qB5Cbjwq008398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 5 Dec 2012 07:37:45 -0500
Received: from yakj.usersys.redhat.com (ovpn-112-22.ams2.redhat.com
	[10.36.112.22])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qB5Cbgqh032000; Wed, 5 Dec 2012 07:37:43 -0500
Message-ID: <50BF4015.2050102@redhat.com>
Date: Wed, 05 Dec 2012 13:37:41 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
References: <1349868762-10021-1-git-send-email-pbonzini@redhat.com>
	<50759EEC.8070308@weilnetz.de> <50759F9E.3060800@redhat.com>
	<5075A0FF.3080904@weilnetz.de> <5075A420.10003@redhat.com>
	<5075A843.8020107@weilnetz.de> <5075A966.3090708@weilnetz.de>
	<871uh5tqr7.fsf@explorer.in.ibm.com> <5076BACC.7030309@redhat.com>
	<87y5hdejes.fsf@linux.vnet.ibm.com>
	<87obi8ew14.fsf@linux.vnet.ibm.com>
In-Reply-To: <87obi8ew14.fsf@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	"M. Mohan Kumar" <mohan@in.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtfs-proxy-helper: check
 return code of setfsgid/setfsuid
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
X-List-Received-Date: Wed, 05 Dec 2012 12:38:04 -0000

Il 05/12/2012 09:35, Aneesh Kumar K.V ha scritto:
> I have tested the below patch. Currently i don't have a signed-off-by on
> the patch. One change noted by mohan which I incorporated in the patch
> is we need to call setresgid before calling setresuid. If you are ok
> with this change I can send it upstream.

Yes, please.

Either your version without pointers or mine is okay for me.

Paolo

