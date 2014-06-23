Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wz5rP-0003Vj-U6
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jun 2014 11:08:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wz5rF-0003Ui-8m
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 11:08:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wz5r2-0001KT-Ux
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 11:08:33 -0400
Received: from mail-pb0-x233.google.com ([2607:f8b0:400e:c01::233]:36691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Wz5r2-0001I7-NL; Mon, 23 Jun 2014 11:08:20 -0400
Received: by mail-pb0-f51.google.com with SMTP id rp16so6002981pbb.10
	for <multiple recipients>; Mon, 23 Jun 2014 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=zoqfygkp/swzPSmcBnHDyUGfF+ZkQD2GM/2vyzqNzqY=;
	b=eii72dsremUdRVXitz8bN+knVddCz0kjZUcRt6a8ejIQY6D8KCoulLJSnZDiM7ruuy
	FzIgEQdON1ZNSznFllSSFm5HInXO318oUeinCgNSsrRsTbTpmv4ZeQt2XrOSis0uBVRp
	X/gWO3LbHWGDpAcL/1Dqy1peb/D80V9ZEUQYFTToWGxA9Umf8mV38/TxzGJE8i85cVVg
	WtxmuSfl3Lb6S3Eqv674wNoo7fK2tJGzCfYMhRtpv1RdC94zzDhd7/BpDh0WbQrNYmuz
	4S0Dn+ftInkFqPC3A17ZD6pfuZBqfBnhdGYZHThflUxkr3fzCN4B7ZmVbQS/reiMCep5
	uVCQ==
X-Received: by 10.68.250.3 with SMTP id yy3mr29912817pbc.56.1403536098937;
	Mon, 23 Jun 2014 08:08:18 -0700 (PDT)
Received: from [192.168.1.102] ([223.72.65.105])
	by mx.google.com with ESMTPSA id br1sm27382095pbc.6.2014.06.23.08.08.16
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 23 Jun 2014 08:08:18 -0700 (PDT)
Message-ID: <53A842D8.1040204@gmail.com>
Date: Mon, 23 Jun 2014 23:08:08 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <53A59DD1.2020706@gmail.com>
	<20140623073806.GB13485@stefanha-thinkpad.redhat.com>
In-Reply-To: <20140623073806.GB13485@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::233
Cc: kwolf@redhat.com, qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] block.c: Correct
 the return value and the failure object when failure occurs
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
X-List-Received-Date: Mon, 23 Jun 2014 15:08:42 -0000

On 06/23/2014 03:38 PM, Stefan Hajnoczi wrote:
> 
> The return value of bdrv_open() is a negative errno.  -1 does not make
> sense in this case.
> 
> Please add an int return value to bdrv_append_temp_snapshot() so the
> caller can determine the real errno.  Then the remainder of the patch
> can be:
> 
>      if (snapshot_flags) {
> -        bdrv_append_temp_snapshot(bs, snapshot_flags, &local_err);
> +        ret = bdrv_append_temp_snapshot(bs, snapshot_flags, &local_err);
>          if (local_err) {
> -            error_propagate(errp, local_err);
>              goto close_and_fail;
>          }
>      }
> 

That's fine to me, I shall send patch v2 for it.

Thanks.
-- 
Chen Gang

Open share and attitude like air water and life which God blessed

