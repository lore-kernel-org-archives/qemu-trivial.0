Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSL9h-0003dI-7t
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 10:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSL9X-0003cD-SO
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 10:19:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSL9V-0008B8-62
 for qemu-trivial@nongnu.org; Tue, 13 Oct 2020 10:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602598783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WOv27z5xhdK4/eY0BmPUYbYYvfCTu8eURB6iPyPgwCo=;
 b=IJ8hKIxezZ1VXAelJ9FFMbrn9jzvPDgJx56+y5uR1tsjkPWeDYPcQwT8vADxGK0d6MyGXW
 ZZtHJD5VZ20lObMmi777/mvb9f+YAykehKiFxtpvvXryNOe7TjBqa29AY606uxgGUuN45G
 A3tS8HurpJ6+nh6FAZjHSkP1NlzokDg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-NPSULqjAMsC5kXlG47Ceew-1; Tue, 13 Oct 2020 10:19:41 -0400
X-MC-Unique: NPSULqjAMsC5kXlG47Ceew-1
Received: by mail-wm1-f70.google.com with SMTP id w23so43364wmi.1
 for <qemu-trivial@nongnu.org>; Tue, 13 Oct 2020 07:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WOv27z5xhdK4/eY0BmPUYbYYvfCTu8eURB6iPyPgwCo=;
 b=YlaNWQMt0kF0MWHvl8YjTDEHld4Lb4bdABBF/nUiMirpPcpRDdOqRrHrJLDkLG2Wzc
 BamOMZX8iBtJfxv4BBqsnpvW5axIYgXG5VZgG+JR7N7vMGqL88CLBjecgnF8HBrjrHdq
 5FIZvVWKAvyXrRUKJx2Z07NzRdvpEMTMFo8oDXUHeTQKSw2eFumjcR6531eZdwTHyNX+
 U/6TBrXdAaaC9TZg0MzKVc2er1l5xINXXV9MlPqH0ImQA2GsRjkqEo1Si+E5rUWQmHRp
 cTN4TtKMqfALajwHLAUaCIdl5AgBTD6/7gKArF/H0N2ZywwVQq+nSNiOSre8/ZkOmUwh
 aZ3Q==
X-Gm-Message-State: AOAM533LpX0CmwffCC0vJgDu+OOzxJGVNQ83GRwSeS93fhYYhihzlfWi
 BOUN58CXAaRETJbAhWavJ6MdSr8lIJtkzJL46ydkkTNpSXP267O3aem+vFVhmQwAjijZxSkKBvn
 T3GnoPYJvWuVoO55O+w==
X-Received: by 2002:a7b:c085:: with SMTP id r5mr67477wmh.17.1602598780454;
 Tue, 13 Oct 2020 07:19:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo5/56Ij4h9ohtF/0X5tYD7oS0nXWeIZfP9rItx4BzKzGPSeg/6fNkM1p5jU2GKPuklOHgnQ==
X-Received: by 2002:a7b:c085:: with SMTP id r5mr67452wmh.17.1602598780209;
 Tue, 13 Oct 2020 07:19:40 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id t12sm19759134wrm.25.2020.10.13.07.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 07:19:39 -0700 (PDT)
Subject: Re: [PATCH] qmp-shell: Sort by key when pretty-printing
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
References: <20201013141414.18398-1-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <71a27e2a-3883-fc4f-647f-594b49f62816@redhat.com>
Date: Tue, 13 Oct 2020 16:19:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201013141414.18398-1-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 03:04:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 13 Oct 2020 14:19:49 -0000

On 10/13/20 4:14 PM, David Edmondson wrote:
> If the user selects pretty-printing (-p) the contents of any
> dictionaries in the output are sorted by key.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>   scripts/qmp/qmp-shell | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
> index c5eef06f3f..b4d06096ab 100755
> --- a/scripts/qmp/qmp-shell
> +++ b/scripts/qmp/qmp-shell
> @@ -260,7 +260,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
>           indent = None
>           if self._pretty:
>               indent = 4
> -        jsobj = json.dumps(qmp, indent=indent)
> +        jsobj = json.dumps(qmp, indent=indent, sort_keys=self._pretty)
>           print(str(jsobj))
>   
>       def _execute_cmd(self, cmdline):
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


