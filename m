Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YspwB-0000h1-Tv
	for mharc-qemu-trivial@gnu.org; Thu, 14 May 2015 06:00:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Yspw5-0000gl-IS
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 06:00:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Yspw0-0005Nr-I5
	for qemu-trivial@nongnu.org; Thu, 14 May 2015 06:00:13 -0400
Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c]:33446)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Yspw0-0005N0-BQ; Thu, 14 May 2015 06:00:08 -0400
Received: by wgin8 with SMTP id n8so69818226wgi.0;
	Thu, 14 May 2015 03:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=DkGiWDm0y9t9UktD4NeMkPcPRifNxp7W36JCrR4LI/8=;
	b=APM3I0ItV/OWuYSs7lE+xH7gPOB9/QL+afx8amvYun/Soxn8toJO+X5dq6AeHPAuza
	hc0adPsZ6G2KTdA2ctLFw3vnJo5Eupky1NmCsP2OzwSzL+viHW3YR1jjj+keA5ToV4Sl
	3/60A/7Z8GFA6KBHybr/UTONDlAIgZkyj5U2XdEl+ky96mUc+E+98QKZueu0v53O7BT0
	xlmdrRE5LGLPx1mjVls77y+se7tfOu99UFYp01jCN9DCOfVTnqV0vlP58fzGAXH0LJNb
	Scp22D+cAQQ7LRKpam+E0eR7zyQQcLTH6HJmVFHXoKuCuv/XMOC1gs7eprLIQv9d8ITe
	FpaQ==
X-Received: by 10.180.78.65 with SMTP id z1mr5350565wiw.14.1431597607513;
	Thu, 14 May 2015 03:00:07 -0700 (PDT)
Received: from [192.168.10.165] (dynamic-adsl-94-39-167-193.clienti.tiscali.it.
	[94.39.167.193]) by mx.google.com with ESMTPSA id
	lh8sm25374365wjc.23.2015.05.14.03.00.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 May 2015 03:00:05 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <55547221.4030109@redhat.com>
Date: Thu, 14 May 2015 12:00:01 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Martin Cerveny <M.Cerveny@computer.org>, qemu-devel@nongnu.org
References: <1431519294-8873-1-git-send-email-M.Cerveny@computer.org>
	<1431519294-8873-3-git-send-email-M.Cerveny@computer.org>
In-Reply-To: <1431519294-8873-3-git-send-email-M.Cerveny@computer.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22c
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 2/2] scripts: qom-tree: add support of
	path as argument
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
X-List-Received-Date: Thu, 14 May 2015 10:00:19 -0000



On 13/05/2015 14:14, Martin Cerveny wrote:
>      for item in items:
>          if item['type'].startswith('child<'):
> -            list_node(path + '/' + item['name'])
> +            list_node((path if (path != '/') else '')  + '/' + item['name'])

I'm not sure which Python version introduced if...else.  The more
traditional idiom would be

	path != '/' and path or ''

Can you use it, and move the expression out of the 'for item in items'
loop into a variable?

Paolo

