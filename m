Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPqC8-0006AB-Nz
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 05:20:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1WPqBv-0005Zv-Di
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 05:20:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1WPqBq-0001e7-8n
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 05:20:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1WPqBd-0001K0-Te; Tue, 18 Mar 2014 05:19:54 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2I9Jlht025608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 18 Mar 2014 05:19:51 -0400
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with SMTP
	id s2I9JjiA006028; Tue, 18 Mar 2014 05:19:45 -0400
Date: Tue, 18 Mar 2014 10:19:45 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Maria Kustova <maxa@catit.be>
Message-ID: <20140318091945.GD4607@noname.str.redhat.com>
References: <1395122359-28890-1-git-send-email-maria.k@catit.be>
	<1395122359-28890-4-git-send-email-maria.k@catit.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395122359-28890-4-git-send-email-maria.k@catit.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
	Maria Kustova <maria.k@catit.be>
Subject: Re: [Qemu-trivial] [PATCH v2 3/3] qemu-io: Extended "--cmd"
 description in usage text
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
X-List-Received-Date: Tue, 18 Mar 2014 09:20:16 -0000

Am 18.03.2014 um 06:59 hat Maria Kustova geschrieben:
> It's not clear from the usage description that "--cmd" option accepts its argument as a string, so any special symbols have to be quoted from the shell.

For future patches, please make sure to wrap your lines in the commit
message at ideally ~72, but at most 80 characters. This instance I fixed
up while applying the patch.

Kevin

> Updates in usage text:
>  - Specified parameter format for "--cmd" option.
>  - Added an instruction how to get help for "--cmd" option.
> 
> Signed-off-by: Maria Kustova <maria.k@catit.be>

