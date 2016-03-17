Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1agZR8-0003f2-F8
	for mharc-qemu-trivial@gnu.org; Thu, 17 Mar 2016 11:02:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1agZR1-0003Qg-6Q
	for qemu-trivial@nongnu.org; Thu, 17 Mar 2016 11:02:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1agZQv-0001H8-J4
	for qemu-trivial@nongnu.org; Thu, 17 Mar 2016 11:01:59 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:36554)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1agZQv-0001Gw-CP; Thu, 17 Mar 2016 11:01:53 -0400
Received: by mail-pf0-x244.google.com with SMTP id q129so11706911pfb.3;
	Thu, 17 Mar 2016 08:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PAomUiNa59LmFFbnAHvrsxlpeWWvVKg/864f1usyg5U=;
	b=EKkvx6W0uCL/UHU3+L9AZH7YBU3MjBTn7Y4WEQ4SnxEWGKhwkEm5i1l4FDFMjxt58G
	G+7Crkyjp+NfUVXZcb8wKwnNY6i07oPsAb8GpH0FZlSjAALAhMKBXu4sKzI4kWD6PyP0
	n/MXVvaEHLqYNWfMZlO2XIOntN8xfEWYOSWrnynBjtRzB8Zwn+fQduwwV5mXRSiGFaH1
	hDlbxJvJcrkyVZIxiBHoiY47m8PVLeP20OinbsBXvMpQN7645jEPzvStZbTypoPAcay6
	PKJbBaN+0NjC69vTaGmT/miyr8l2DlXZe7E7VJiO4gUlodBPclYDRXigcal2JYZUYdNC
	57Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PAomUiNa59LmFFbnAHvrsxlpeWWvVKg/864f1usyg5U=;
	b=ftDcJCeDfNrcnO2+/0zpvph4k5ZJJv66p2pJI/OHxt0s+AcWdyEp8C7jaoaAf10Dhr
	N8uh20CBFbhxKXb/CJbg5A4u/iCHef7Gz+P26yrCn3cIt1/EtJ1KmY/Z6p4B6aVJyG9j
	iqg1rVaBtdnu6kHIBCmEb4WIKWUrIbTmlSywMagB3tRFXEK+EB+4im5xIDd7OXU+EmPM
	Oq6RXUHQ2mRDVevZX/MRnLyd1NJiiQQ5FgXdsDdJdaMscRbnYIIufdttWL/mlzbYQWwR
	kR6OXc0W68rH3UcBAFNcpaGjwKwJAUIonwnBGEkq8uMD5VcAgoC5Su/q2547S23wMX58
	uuUA==
X-Gm-Message-State: AD7BkJJXqubGY8SqoiOJTtB8HvmL0Y0SonD+XMNV2zK6iZj7PqYsxnI5VOl8A8DMUAVtPg==
X-Received: by 10.98.12.154 with SMTP id 26mr15606348pfm.20.1458226912244;
	Thu, 17 Mar 2016 08:01:52 -0700 (PDT)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	ll7sm14112414pab.6.2016.03.17.08.01.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 08:01:51 -0700 (PDT)
Date: Thu, 17 Mar 2016 15:01:49 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160317150149.GA1772@vultr.guest>
References: <1455152067-19900-1-git-send-email-richard.weiyang@gmail.com>
	<56E9433C.1040503@msgid.tls.msk.ru> <56E94914.1040803@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56E94914.1040803@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Cc: qemu-trivial@nongnu.org, alex.williamson@redhat.com,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH] vfio/pci: replace 1 with
 PCI_CAP_LIST_NEXT to make code self-explain
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Wei Yang <richard.weiyang@gmail.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2016 15:02:04 -0000

On Wed, Mar 16, 2016 at 12:52:52PM +0100, Paolo Bonzini wrote:
>
>
>On 16/03/2016 12:27, Michael Tokarev wrote:
>>> >      for (tmp = pdev->config[PCI_CAPABILITY_LIST]; tmp;
>>> > -         tmp = pdev->config[tmp + 1]) {
>>> > +         tmp = pdev->config[tmp + PCI_CAP_LIST_NEXT]) {
>>> > -    next = pdev->config[pos + 1];
>>> > +    next = pdev->config[pos + PCI_CAP_LIST_NEXT];
>> Hmm. I'm not sure the new version is better, to me "+1" reads
>> easier than the new symbolic constant variant.
>> 
>> If it were something like pdev->config[PCI_CAP_LIST_NEXT], that'd be
>> nice, but not "pos + PCI_CAP_LIST_NEXT".
>> 
>> But again, I'm not pci config space expert and don't understand
>> the basics :)

Thanks Michael for your comment. By using the macro, audience is more easy to
understand it tries to get the position of next capability.

>
>Each capability is a node of a linked list, and the position of the next
>capability is at offset 1 inside the capability (here it is at offset 1
>from the tmp or pos base).  I think the patch is an improvement.
>

Thanks Paolo for your reply. :-) 

>Paolo

-- 
Wei Yang
Help you, Help me

