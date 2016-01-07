Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aH9ta-0001DB-CG
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jan 2016 07:42:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aH9tY-0001AH-N3
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:42:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aH9tX-0001pz-Tt
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:42:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1aH9tV-0001pR-SQ; Thu, 07 Jan 2016 07:42:21 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 67A5239F51D;
	Thu,  7 Jan 2016 12:42:21 +0000 (UTC)
Received: from [10.36.112.74] (ovpn-112-74.ams2.redhat.com [10.36.112.74])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u07CgHj4001135
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 7 Jan 2016 07:42:19 -0500
To: Sitsofe Wheeler <sitsofe@yahoo.com>, qemu-devel@nongnu.org
References: <1451979212-25479-1-git-send-email-sitsofe@yahoo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <568E5D29.4000805@redhat.com>
Date: Thu, 7 Jan 2016 13:42:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1451979212-25479-1-git-send-email-sitsofe@yahoo.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2 0/3] qemu-nbd.texi formatting,
 grammar and completeness fixes
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
X-List-Received-Date: Thu, 07 Jan 2016 12:42:25 -0000



On 05/01/2016 08:33, Sitsofe Wheeler wrote:
> Bring the qemu-nbd man page up to date with options and fix some styling and
> grammar issues along the way.
> 
> Changes from v1:
> - Add disconnect usage to synopsis.
> - Add styling to synopsis usage.
> - Fix up the grammar in the description.
> - Move filename variable description out of the option table.
> - Add a description of the NBD dev variable.
> - Add reference to qemu man page to see also section.
> - Fix sentence capitalisation in options section.
> 
> Sitsofe Wheeler (3):
>   qemu-nbd: Fix unintended texi verbatim formatting
>   qemu-nbd: Minor texi updates
>   qemu-nbd: Fix texi sentence capitalisation
> 
>  qemu-nbd.texi | 80 +++++++++++++++++++++++++++++++++--------------------------
>  1 file changed, 45 insertions(+), 35 deletions(-)
> 

Thanks, queued.  Will send a pull request some time next week.

Paolo

