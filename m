Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WSQk2-0001rz-P0
	for mharc-qemu-trivial@gnu.org; Tue, 25 Mar 2014 08:46:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WSQjv-0001bX-JY
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 08:46:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1WSQjq-0001HC-9E
	for qemu-trivial@nongnu.org; Tue, 25 Mar 2014 08:45:59 -0400
Received: from mail-we0-x235.google.com ([2a00:1450:400c:c03::235]:59736)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1WSQje-0001Di-MQ; Tue, 25 Mar 2014 08:45:42 -0400
Received: by mail-we0-f181.google.com with SMTP id q58so266734wes.26
	for <multiple recipients>; Tue, 25 Mar 2014 05:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uAqGci4Pu7gN/QDwHlzVSk3P+CYx7EqmEx97QRQy1RQ=;
	b=Tf2lVdFHLunmZrzQTCpLta1L8EtE7hRWK3VKqb5Qpx/AW89Pqau541pFk2JTGa7ZWz
	0Dv2Uiz/CfBkBiJm/0R4SM2sWnATn7Evy77T9dZxsq48+7Il+a5BG9o9H/1xMVVX+Vne
	IW1OUgCcU8WEPGmRsUxQoP2zublNjO2Mu/D8F5YFOUw+iLRiZXIUXxxZ651StkcuN1ks
	7Ji6CN0Capyk+/BRxGDxGTZPXs2SKPNEhcpu/YllNZ4mWGhT8MQ9fvscrJeBb5hospa2
	1dloDXxOUhD617hRUdNwuvJZ3kZMN57h1/fUGILTdlH4XSB7tUiMilnoeM1XPybdUceQ
	cy8w==
X-Received: by 10.181.9.65 with SMTP id dq1mr21869846wid.51.1395751541306;
	Tue, 25 Mar 2014 05:45:41 -0700 (PDT)
Received: from localhost (95-91-232-83-dynip.superkabel.de. [95.91.232.83])
	by mx.google.com with ESMTPSA id u6sm49961344wif.6.2014.03.25.05.45.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Mar 2014 05:45:40 -0700 (PDT)
Date: Tue, 25 Mar 2014 13:45:38 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Deepak Kathayat <deepak.mk17@gmail.com>
Message-ID: <20140325124538.GC29231@stefanha-thinkpad.redhat.com>
References: <1395649817-20742-1-git-send-email-deepak.mk17@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395649817-20742-1-git-send-email-deepak.mk17@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::235
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fixed various typos
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
X-List-Received-Date: Tue, 25 Mar 2014 12:46:05 -0000

On Mon, Mar 24, 2014 at 04:30:17PM +0800, Deepak Kathayat wrote:
> 
> Signed-off-by: Deepak Kathayat <deepak.mk17@gmail.com>
> ---
>  block/gluster.c  |    2 +-
>  block/qcow.c     |    2 +-
>  block/sheepdog.c |    8 ++++----
>  block/vdi.c      |    2 +-
>  block/vhdx-log.c |    2 +-
>  slirp/tftp.c     |    2 +-
>  6 files changed, 9 insertions(+), 9 deletions(-)

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

