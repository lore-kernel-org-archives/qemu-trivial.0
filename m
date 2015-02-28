Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRkRR-0007Hs-EX
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 11:40:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YRkRP-0007Hh-OY
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 11:40:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YRkRL-0007fM-V9
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 11:40:35 -0500
Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e]:33504)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YRkRL-0007fF-Nw; Sat, 28 Feb 2015 11:40:31 -0500
Received: by wghb13 with SMTP id b13so25818633wgh.0;
	Sat, 28 Feb 2015 08:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=wNG0lVDZsaiQYTy+mFiqPZMgjYLmvMrH6l/1a98SHKM=;
	b=lbcLBJXVtkbUYMZPMmjICZZrzUNsbMKWjI6I+nPdBNnT7vFO/xJuGanFOXeo/C4UCx
	++X+N4tftR4wjN0Ow+F5GUB9n3dND2PmgVEFUhqMZR2VvxGlRZgrMGJniOh5s2LAh4zT
	fgbTXbDJ4x2obhz7CaUxkn5dv/jfkFJXzU6w7oURWqrmegYyE/05G43xWWHC85k/q3Tf
	opdGzsfshbFKfAfwXEyX13omlhFrsc6C6EIb+cTv+Z3fMBieE7TYY4kbwS8kUJLeK25Q
	J9aH+k1HUqmyu8bokBLJSrsehmeljgT5u7cWU+XXFzDkHK1O8HiXhshic5B9Sfycxhen
	BDrg==
X-Received: by 10.194.156.133 with SMTP id we5mr40758539wjb.37.1425141630992; 
	Sat, 28 Feb 2015 08:40:30 -0800 (PST)
Received: from [192.168.10.150] (net-37-116-207-136.cust.vodafonedsl.it.
	[37.116.207.136])
	by mx.google.com with ESMTPSA id m4sm7646086wik.20.2015.02.28.08.40.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 28 Feb 2015 08:40:29 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54F1EF7A.4040007@redhat.com>
Date: Sat, 28 Feb 2015 17:40:26 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, arei.gonglei@huawei.com, 
	qemu-devel@nongnu.org
References: <1425118124-11888-1-git-send-email-arei.gonglei@huawei.com>
	<54F194B7.9080603@msgid.tls.msk.ru>
In-Reply-To: <54F194B7.9080603@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22e
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] e500: fix memory leak
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
X-List-Received-Date: Sat, 28 Feb 2015 16:40:36 -0000



On 28/02/2015 11:13, Michael Tokarev wrote:
> 28.02.2015 13:08, arei.gonglei@huawei.com пишет:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>> v2: fix compilation complaint. (mjt)
>> ---
>>  hw/ppc/e500.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>> index 7e17d18..c060b50 100644
>> --- a/hw/ppc/e500.c
>> +++ b/hw/ppc/e500.c
>> @@ -309,8 +309,10 @@ static int ppce500_load_device_tree(MachineState *machine,
>>  
>>          fdt = load_device_tree(filename, &fdt_size);
>>          if (!fdt) {
>> +            g_free(filename);
>>              goto out;
>>          }
>> +        g_free(filename);
>>          goto done;
>>      }
> 
> 
> How about this?
> 
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -308,6 +308,7 @@ static int ppce500_load_device_tree(MachineState *machine,
>          }
> 
>          fdt = load_device_tree(filename, &fdt_size);
> +        g_free(filename);
>          if (!fdt) {
>              goto out;
>          }

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

See also xilinx_load_device_tree:

        /* Try the local "ppc.dtb" override.  */
        fdt = load_device_tree("ppc.dtb", &fdt_size);
        if (!fdt) {
            path = qemu_find_file(QEMU_FILE_TYPE_BIOS, BINARY_DEVICE_TREE_FILE);
            if (path) {
                fdt = load_device_tree(path, &fdt_size);
                g_free(path);
            }
        }

Paolo

