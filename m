Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioov0-0006Ak-Ve
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jan 2020 08:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iooux-00061H-Be
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 08:29:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ioouv-00044Y-QH
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 08:29:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47599
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ioouv-00043J-HT
 for qemu-trivial@nongnu.org; Tue, 07 Jan 2020 08:29:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578403745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SBM0R32glpMVuot9fSWTjQ1+QD7ILwo94E2L+NFbt3k=;
 b=ZlKKAmFjMPYSS9hwdI7jk5hwXVss1xE7CxHfUM+mnr7p3ljkmKDAkZrsA30LGT11Nwx1MY
 xHoNAB8o49aH2tfxbZPhmNA1NoDMqE/BPU2zBSL+c9jbfl/uoHQTpcqMpntH/wGgzIWT4d
 5+kZ2NYsOzr3J8nrYddteZH9i869I3I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-7tDabqknM1q0bxMqYirjNw-1; Tue, 07 Jan 2020 08:29:03 -0500
Received: by mail-wm1-f71.google.com with SMTP id h130so4103828wme.7
 for <qemu-trivial@nongnu.org>; Tue, 07 Jan 2020 05:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SBM0R32glpMVuot9fSWTjQ1+QD7ILwo94E2L+NFbt3k=;
 b=l+LtZd7p3OC+He6ge9iLcpqYNvcqQ0NmJXn6JThtWGjyOJpLN7ydhc9OvleXUscjpM
 idh+7U8Zs5m/U0wpt9Gvcl7fQF+C+jJP1ueT8JJmLSJH0jua2aBIuBvYl3SPMwdJqc4N
 jOsVYlTmb118HUxOIZrBd6SUUE5Y1gklcspnKBKZk2uXH1KXdQ+DchIc2WV92q50O79i
 CdJYFLp2MC+lSv8+jO51Qh5KIqSaQqF5+R7sa6DlLhMmSpx9uBNUqB93wZlVHEW5IIlx
 OH4gQlvAVhkus3CD2N4kOK3oldw9G92sabN0G9p7yonTgkDcNafFEhaihJ4Q8fW3GFBQ
 VnRg==
X-Gm-Message-State: APjAAAXg/Kw/tHr2CHwqPmdyGzsoXuIWJpJN3dcgAUoQ2QJgeE8xJkNL
 QUsPwNjgUm5ytJFP85yp23K5OwoxzSLf1tzaPjWBnDmU6Ct7nerp8PLVa0taQduhHxYm+GwtQ5r
 F97enD1tjYG3bl9/gFw==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr38901853wmc.57.1578403742910; 
 Tue, 07 Jan 2020 05:29:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqwjXVv7ouLDbitXju/95vWo7+UF9DVG8hZVlNxGRslqnI5/Cgk19r7pCe8P91E0lioe/Pv6OQ==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr38901832wmc.57.1578403742639; 
 Tue, 07 Jan 2020 05:29:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c6d:4079:b74c:e329?
 ([2001:b07:6468:f312:c6d:4079:b74c:e329])
 by smtp.gmail.com with ESMTPSA id p18sm26735668wmb.8.2020.01.07.05.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 05:29:01 -0800 (PST)
Subject: Re: [PATCH v4] target/i386: Fix handling of k_gs_base register in
 32-bit mode in gdbstub
To: "Marek Dolata - mkdolata@us.ibm.com" <mkdolata@us.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Doug Gale <doug16k@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>
References: <4afa19236529458282794f682dfac556@us.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1f942e38-d3bf-0d12-89fe-0ccf72f763d0@redhat.com>
Date: Tue, 7 Jan 2020 14:29:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <4afa19236529458282794f682dfac556@us.ibm.com>
Content-Language: en-US
X-MC-Unique: 7tDabqknM1q0bxMqYirjNw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2020 13:29:10 -0000

On 29/12/19 03:48, Marek Dolata - mkdolata@us.ibm.com wrote:
> Fixes: corrects clobbering of registers appearing after k_gs_base
> Buglink: https://bugs.launchpad.net/qemu/+bug/1857640
> 
> Signed-off-by: Marek Dolata <mkdolata@us.ibm.com>

Queued.  Note that I had to apply the patch by hand since you probably did
some cut-and-paste job.  I also added a meaningful commit message:

    gdb-xml/i386-32bit.xml includes the k_gs_base register too, so we have to
    handle it even if TARGET_X86_64 is not defined.  This is already done in
    x86_cpu_gdb_read_register, but not in x86_cpu_gdb_write_register where the
    incorrect return value causes all registers after it to be clobbered.
    
    Fixes https://bugs.launchpad.net/qemu/+bug/1857640.

Thanks,

Paolo


