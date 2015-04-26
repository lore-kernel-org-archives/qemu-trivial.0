Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmOgG-0004bP-6f
	for mharc-qemu-trivial@gnu.org; Sun, 26 Apr 2015 11:41:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1YmMQr-0006j1-IK
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 09:17:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1YmMQq-0001zC-IB
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 09:17:13 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:36265)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>)
	id 1YmMQm-0001yc-Ag; Sun, 26 Apr 2015 09:17:08 -0400
Received: by wizk4 with SMTP id k4so70539538wiz.1;
	Sun, 26 Apr 2015 06:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=MrgcuxHEayvfVNP7k/esWFn1rFCetqtY2t1dWt/eRVs=;
	b=EFBawbjm2xPXQK+vFoGK/e3DfHSDyCOpTMjKwTw6EBsolzZ+ngdUWsJ9JCiOvCQ3u/
	3wbeAeh9bqChV7kTuvTZAJ8yfHxHmvDABeP13DnfQTBFlueNC1SMnfF5hLruElRfFZcf
	UY1yw3gn+yAGSolzgb0frkgT6i+78MYDrUH91+dy4mXPIxdI340kQQz0JgtkPwhnQppH
	wg6VQqpgiip0Va/Fb0JgWzCccD2VZhdzr3HOK2FXwwu9Zu2qC3+1HerXiLW52eQUQuCD
	9k81m9uFK5PwI1FQgB8WMXFSlBHsrgRWR9TJQuWyGeFAd7VcXiXjeozrWIy8i2Bo5aLN
	qhRw==
X-Received: by 10.180.82.100 with SMTP id h4mr12805232wiy.84.1430054227087;
	Sun, 26 Apr 2015 06:17:07 -0700 (PDT)
Received: from tpl530 (p57AEC2C2.dip0.t-ipconnect.de. [87.174.194.194])
	by mx.google.com with ESMTPSA id r9sm25097808wjo.26.2015.04.26.06.17.05
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Sun, 26 Apr 2015 06:17:06 -0700 (PDT)
Date: Sun, 26 Apr 2015 15:17:03 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20150426151703.161075bb@tpl530>
In-Reply-To: <20150318122235.7eb71f08@oc7435384737.ibm.com>
References: <20150318122235.7eb71f08@oc7435384737.ibm.com>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.181
X-Mailman-Approved-At: Sun, 26 Apr 2015 11:41:15 -0400
Cc: Thomas Huth <thuth@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH v2 0/7] Remove more unused functions
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
X-List-Received-Date: Sun, 26 Apr 2015 13:17:14 -0000

Am Wed, 18 Mar 2015 12:22:35 +0100
schrieb Thomas Huth <thuth@linux.vnet.ibm.com>:

> 
> Here are some more patches to remove completely unused functions
> from QEMU. Please review carefully, some of the functions might
> still get usefull in the future again, so if you discover one,
> please let me know, then I'll remove it from the patch series
> again.
> 
> v2: Changed series according to review comment from v1:
> - Dropped the patch to remove portio_list_destroy() and
> portio_list_del()
> - Keep the ARI functions in the pci patch since they might get useful
> again
> 
> Thomas Huth (7):
>   migration: Remove unused functions
>   vmxnet: Remove unused function vmxnet_rx_pkt_get_num_frags()
>   pci: Remove unused function ich9_d2pbr_init()
>   monitor: Remove unused functions
>   usb: Remove unused functions
>   util: Remove unused functions
>   Remove various unused functions

Ping! Now that 2.3.0 (congrats!) has been tagged, could somebody
(Michael via qemu-trivial tree?) please pick up patches 2 to 7? As far
as I know, there haven't been any complaints about them anymore, so I
think it should be ok to include them.
(patch 1 has already been included via the migration tree, so that's
already fine)

 Cheers,
  Thomas

