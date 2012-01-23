Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RpIOj-0001he-O6
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jan 2012 06:49:17 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RpIOd-0001Md-5Y
	for qemu-trivial@nongnu.org; Mon, 23 Jan 2012 06:49:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1RpIOY-0003jg-Tz
	for qemu-trivial@nongnu.org; Mon, 23 Jan 2012 06:49:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:65263)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1RpIOQ-0003iA-2s; Mon, 23 Jan 2012 06:48:58 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0NBmv5u011139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 23 Jan 2012 06:48:57 -0500
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0NBms9w014579
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Mon, 23 Jan 2012 06:48:56 -0500
Message-ID: <4F1D49F4.5090801@redhat.com>
Date: Mon, 23 Jan 2012 12:52:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1327150464-29682-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1327150464-29682-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] block/vdi: Zero unused parts when
 allocating a new block (fix #919242)
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
X-List-Received-Date: Mon, 23 Jan 2012 11:49:15 -0000

Am 21.01.2012 13:54, schrieb Stefan Weil:
> The new block was filled with zero when it was allocated by g_malloc0,
> but when it was reused later and only partially used, data from the
> previously allocated block were still present and written to the new
> block.
> 
> This caused the problems reported by bug #919242
> (https://bugs.launchpad.net/qemu/+bug/919242).
> 
> Now the unused parts of the new block which are before and after the data
> are always filled with zero, so it is no longer necessary to zero the whole
> block with g_malloc0.
> 
> I also updated the copyright comment.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Thanks, applied to the block branch (this is not trivial!)

Kevin

