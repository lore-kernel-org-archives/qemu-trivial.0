Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEfyC-0000kM-LK
	for mharc-qemu-trivial@gnu.org; Thu, 11 Apr 2019 16:06:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hEfyA-0000ih-8O
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 16:06:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hEfy9-0003qO-9P
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 16:06:46 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:48421)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hEfy8-0003jj-Oy; Thu, 11 Apr 2019 16:06:45 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
	1MeCYx-1gdPaw3s7L-00bHiM; Thu, 11 Apr 2019 22:01:30 +0200
To: Markus Armbruster <armbru@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-trivial@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
	afaerber@suse.de, qemu-devel@nongnu.org
References: <20190311083234.20841-1-richardw.yang@linux.intel.com>
	<20190312084313.webcenp43tk3yfmm@steredhat>
	<87tvfghqg7.fsf@dusky.pond.sub.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <51367507-2b5a-151d-af0f-5404448bbdad@vivier.eu>
Date: Thu, 11 Apr 2019 22:01:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <87tvfghqg7.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:23VmX65z7zcw3eA8ma19KipOHGAOQ/RGNYlSOeDq70vxdPniDFS
	nuTbIdrtCzMjOUVcX2Qfg0q1Bps+e5biIntQwjxd0ic4VA5C0e0CFakBLJDllRHC+RYJYlX
	hlBXS3Ms01x47ddHHPbugm8fZgBesc7DhnRRb5eTuBoAsYjuZq7UZDrw85Ro9p6z8PgbDeB
	YGy8DbuRj9wevWUFjeRzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mgSHuX1mVUs=:AYO5QZJVe+2+iithowgRVz
	2F4YQbaGNLKOKPmR9e2Ot6xLuclCILlj9Ja3R+srIwzGrrJTltJaO85UnJYSNRW/xlE1PZV8X
	HXxPeqTNrgMbg5EWTaSaRReGMHuV8aBA+iPTUq/7P1ojOh3P5pCC/pqhSAI3h9UBNHBx5C3Y/
	tFJ2XnSJ8ceK6+nLnbAEseFZvYtK8Agf8rRhvQnn0O4l4qdObVmi+Q/UohvpvRsbfuPayBltb
	2eakvrlf7+A2tCSg2mPT+c/aOGUfzYQfzXYKKPdTXJNBexR1qiBen/TewCDpmwm6NztHkc2aL
	lDUz639UvIloMpgBcJ3FzgeLEjNpIA+93AMJ6WnxkQs1Bv29pWVAyMWUh1U9CoOdVy+4IKEVq
	UmKTAKJ/vn5sWBXIfz1r7VFGX+TW+DBeIhXRvXs0X9nLx7rkwsWEkPEmkv7KMXLRm50DzwwSM
	BQ7RUSxud0LXCGlxJxn8difmevE0QrhiWRjggYFhbcs1k2MPgE7+GgWm+TDI6f3IiXTVr/+7P
	DJ7f+UUqEgFTh2O0owcz1wMPVtepngTAOZ5Y6agzXB55aYjNthvHVSbddRAQK5QtZ5S9r5xBK
	eYd7045dNiZrdnR0XYLldTt/Uwse+il3rqISe1PVqnOgk+C3svRovSv3MeXkK3vAXheJE3F3T
	33HngOyzZ8g3F+bUhNQLMizSpAEfbN9Ub6vTK38SVB0dvwCJjFGoS9OoDLjpNYI+vCDUYXUEZ
	CwuiEDQVb9w9HK6SDgQHeQR5d1OKciitMTU5ytYu+30YKwWf71iu+HNg71g=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qom: use
 object_new_with_type in object_new_with_propv
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
X-List-Received-Date: Thu, 11 Apr 2019 20:06:47 -0000

On 02/04/2019 08:27, Markus Armbruster wrote:
> Stefano Garzarella <sgarzare@redhat.com> writes:
> 
>> On Mon, Mar 11, 2019 at 04:32:34PM +0800, Wei Yang wrote:
>>> Function object_new_with_propv already get the Type of the object, so we
>>> could leverage object_new_with_type here.
>>>
>>> [make check test pass]
>>>
>>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>>> ---
>>>  qom/object.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> LGTM. Just a note for future patches:
>> I think that info like "[make check test pass]" should go after the
>> three dashes to avoid to store it in the commit message.
> 
> Yes.  Whoever applies  should delete this line.
> 
>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> Cc: qemu-trivial for merging.
> 

Applied to my trivial-patches branch with updated commit message.

Thanks,
Laurent

