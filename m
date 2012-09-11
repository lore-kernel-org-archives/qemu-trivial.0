Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TBNdT-0000zr-F4
	for mharc-qemu-trivial@gnu.org; Tue, 11 Sep 2012 06:24:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TBNdK-0000cS-Qu
	for qemu-trivial@nongnu.org; Tue, 11 Sep 2012 06:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1TBNdF-0004ak-5Y
	for qemu-trivial@nongnu.org; Tue, 11 Sep 2012 06:23:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53302)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1TBNd8-0004SZ-7V; Tue, 11 Sep 2012 06:23:42 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8BANdLW005339
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 11 Sep 2012 06:23:39 -0400
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8BANbJH023659
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Tue, 11 Sep 2012 06:23:38 -0400
Message-ID: <504F1129.8060009@redhat.com>
Date: Tue, 11 Sep 2012 12:23:37 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: riegamaths@gmail.com
References: <1346851582-9296-1-git-send-email-riegamaths@gmail.com>
In-Reply-To: <1346851582-9296-1-git-send-email-riegamaths@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block: Don't forget to
 delete temporary file
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
X-List-Received-Date: Tue, 11 Sep 2012 10:24:00 -0000

Am 05.09.2012 15:26, schrieb riegamaths@gmail.com:
> From: Dunrong Huang <riegamaths@gmail.com>
> 
> The caller would not delete temporary file after failed get_tmp_filename().
> 
> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>

Thanks, applied to the block branch.

Kevin

