Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7Iuc-0000zU-J2
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 03:46:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Z7Iua-0000xU-C5
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:46:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Z7IuV-0007gY-EW
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 03:46:28 -0400
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236]:33001)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Z7IuV-0007gK-6Y; Tue, 23 Jun 2015 03:46:23 -0400
Received: by wiwl6 with SMTP id l6so58017134wiw.0;
	Tue, 23 Jun 2015 00:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=C1UTq+SsbtuoJJk33sP9B9XfMK9cxmO7Vm6H0GqVaIU=;
	b=RM9Hs1HyGHpojtLg8B0kZmonc4zqIFuJ0ou/hUSxLuQHWgtDdar26O+BTisVrKo5bM
	QWonwIp6ZQKPcqnHerCV6OoL6/tzwJx2qRuj5Pu4uIvlgq/6A1i1/586iMSvo5iWKT+O
	MQsaF9KI2JfS06WuuQLEZ3QdCpiIZxm4oGEXmRzZ1bsYSx3qrbBj/DThAIEmaNAG+Rsh
	LTYC/Tegx4KQE/Axm2ZQEmSLQ/29ODr+XuvegRY+/aUTMVWcPlagA/hPTuhpaIra4nJ+
	Js1juzuTOAKwpv0APaOgP6aHXboueRYSTFeLNqXCK8hQ2Mlsq+t9z8c2wxXyA/I1EoJ1
	ZPig==
X-Received: by 10.180.90.228 with SMTP id bz4mr849390wib.69.1435045582538;
	Tue, 23 Jun 2015 00:46:22 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-129-53.clienti.tiscali.it.
	[94.39.129.53])
	by mx.google.com with ESMTPSA id q4sm34224958wju.14.2015.06.23.00.46.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jun 2015 00:46:21 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <55890ECC.9040305@redhat.com>
Date: Tue, 23 Jun 2015 09:46:20 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1435024385-9084-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1435024385-9084-1-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::236
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 0/2] fix two overflow problems
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
X-List-Received-Date: Tue, 23 Jun 2015 07:46:29 -0000



On 23/06/2015 03:53, arei.gonglei@huawei.com wrote:
> From: Gonglei <arei.gonglei@huawei.com>
> 
> 
> Gonglei (2):
>   virito-pci: fix OVERRUN problem
>   qdev: fix OVERFLOW_BEFORE_WIDEN
> 
>  hw/core/qdev-properties.c | 2 +-
>  hw/virtio/virtio-pci.c    | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

I queued these two patches in case the maintainers do not pick them up
quickly.

Paolo

