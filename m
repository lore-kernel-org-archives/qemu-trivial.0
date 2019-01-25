Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn102-0007rF-Q4
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 07:54:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn0zv-0007OK-Nc
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 07:54:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gn0r1-0006r3-L1
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 07:45:09 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41803)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gn0r1-0006qf-FL
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 07:45:03 -0500
Received: by mail-wr1-f67.google.com with SMTP id x10so10138959wrs.8
	for <qemu-trivial@nongnu.org>; Fri, 25 Jan 2019 04:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qAL3j1WJle+1kv6vGsCPvXvCwWyD8oGj0WdLnV2FDVg=;
	b=JoJnh4tm/MtlVZ3JcnWRAqxdmWU3EBiLcwesuUn3EfzrCYEnN+PA29lzBPMet0aDA2
	xQZWQIrwbiUcgNicYJwluqq85e0scrKp9XmFT8UkxySRSeezqckTdJ9SPPrtG+KzuMRA
	f7iHS4My1W8/g37R+D8n3nvqamO2v+MaCqA8s4seqkfcbT/yD5qQNbqBRCBqsayYPFE0
	mb0/KeDh1/rCZEKj6YZX98n3oG2ZBjoVWTjEhqndpYt75dTgO72cRYfflIesTPUu08ig
	+wYmwP5oJEWI6jLQmDnRpfke61LdpVFWTmYYq0hjqf/F8h7CcnUmmHWjJDRxZEU97fPi
	9PfA==
X-Gm-Message-State: AJcUukfoeVhGjZtHAWGmHHOfuLuCRbiZVBNNxBIUXvXRRvlooR6tk/Yy
	9nE5hTJ6k5mktPJsbUdnbU1huzFv3hE=
X-Google-Smtp-Source: ALg8bN5fJIXZdct41vgnjDyTIZovOtak2cGCxSw3weVpBp6RgWDu3dzYxHUH69uJdNPidOQZDdXvXQ==
X-Received: by 2002:adf:92c7:: with SMTP id 65mr10749428wrn.228.1548420302144; 
	Fri, 25 Jan 2019 04:45:02 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	a8sm39156750wme.23.2019.01.25.04.45.01
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 04:45:01 -0800 (PST)
To: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
	<ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1548410602-16008-1-git-send-email-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <fa3b6ce0-0fc4-7ee8-653b-5c0aecfa6d30@redhat.com>
Date: Fri, 25 Jan 2019 13:45:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1548410602-16008-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] decodetree: re.fullmatch
 was added in 3.4
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2019 12:54:21 -0000

Cc'ing maintainers :P

$ ./scripts/get_maintainer.pl -f scripts/decodetree.py
Eduardo Habkost <ehabkost@redhat.com> (odd fixer:Python scripts)
Cleber Rosa <crosa@redhat.com> (odd fixer:Python scripts)

On 1/25/19 11:03 AM, Paolo Bonzini wrote:
> Python 3 versions earlier than 3.4 do not have it, use the
> same workaround that is in place for 3.0.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  scripts/decodetree.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
> index 0bc73b5..e342d27 100755
> --- a/scripts/decodetree.py
> +++ b/scripts/decodetree.py
> @@ -204,7 +204,7 @@ def output(*args):
>          output_fd.write(a)
>  
>  
> -if sys.version_info >= (3, 0):
> +if sys.version_info >= (3, 4):
>      re_fullmatch = re.fullmatch
>  else:
>      def re_fullmatch(pat, str):
> 

